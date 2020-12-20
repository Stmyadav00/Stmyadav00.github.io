from flask import Flask ,render_template,request , session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
from werkzeug.utils import secure_filename
import json
import math
import  os
# open the config.json file
with open('config.json','r') as c:
    params=json.load(c)["params"]
# creating our app
app = Flask(__name__)
app.config["UPLOAD_FOLDER"]=params["uploader_location"]
app.secret_key="super-secret-key"
# configuring flask mail parameter
app.config.update(
    MAIL_SERVER="smtp.gmail.com",
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params["gmail_username"],
    MAIL_PASSWORD=params["gmail_password"]
)
# creating mail instace of Mail class
mail=Mail(app)

if(params['local_server']):
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"]
# creating db instace of SQLAlchemy
db = SQLAlchemy(app)
# making class contact to connecting database
class Contact(db.Model):
    serial_number = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_number = db.Column(db.String(12),nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date= db.Column(db.String(12),nullable=True)

class Post(db.Model):
    serial_number = db.Column(db.Integer, primary_key=True)
    slug = db.Column(db.String(20), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    post_heading = db.Column(db.String(12),nullable=False)
    tagline = db.Column(db.String(12),nullable=False)
    img_url = db.Column(db.String(12),nullable=False)
    date= db.Column(db.String(12),nullable=True)

@app.route("/")
def index():
    posts=Post.query.filter_by().all()
     # [0:params['number_of_post']]
    last=math.ceil(len(posts)/int(params['number_of_post']))
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    posts=posts[(page-1)*int(params['number_of_post']):(page-1)*int(params['number_of_post'])+int(params['number_of_post'])]
    if(page==1):
        prev='#'
        next="/?page="+str(page+1)
    elif(page==last):
        prev="/?page="+str(page-1)
        next='#'
    else:
        prev="/?page="+str(page-1)
        next="/?page="+str(page+1)
    return render_template("index.html",params=params,posts=posts,prev=prev,next=next)
@app.route("/about")
def about():
    return render_template("about.html",params=params)
@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")
@app.route("/uploader", methods=['POST'])
def upload():
    if request.method=='POST':
       f=request.files['file1']
       f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename )))
       return"uploaded successfully"
@app.route("/dashboard",methods=['GET','POST'])
def dash():
    if('user' in session and session['user']==params['username']):
        post = Post.query.all()
        return render_template("dashboard.html", params=params,post=post)
    if request.method=='POST':
        username=request.form.get('username')
        password=request.form.get('pass')
        if(username==params['username'] and password==params['password']):
            session['user']=params['username']
            post=Post.query.all()
            return render_template("dashboard.html", params=params,post=post)
    return render_template("login.html", params=params)


@app.route("/contact",methods=['GET','POST'])
def contact():
    if (request.method== 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contact(name=name, email=email, phone_number=phone,date=datetime.now(), msg=message)
        db.session.add(entry)
        db.session.commit()
        mail.send_message("new msg from blog", sender=email, recipients=[params['gmail_username']],
                          body=message+"\n"+ phone)
    return render_template("contact.html",params=params)
@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
      bpost=Post.query.filter_by(slug=post_slug).first()
      return render_template('post.html', params=params,bpost=bpost)

@app.route("/edit/<string:serial_number>",methods=['GET','POST'])
def edit(serial_number):
    if ('user' in session and session['user'] == params['username']):

        if request.method=='POST':
           post_heading=request.form.get('title')
           tagline = request.form.get('tagline')
           slug = request.form.get('slug')
           content = request.form.get('content')
           img_url=request.form.get('img_url')
           date=datetime.now()
           if serial_number=='0':
               post=Post(post_heading=post_heading,tagline=tagline,slug=slug,content=content,img_url=img_url,date=date)
               db.session.add(post)
               db.session.commit()

           else :
               post=Post.query.filter_by(serial_number=serial_number).first()
               post.post_heading=post_heading
               post.tagline=tagline
               post.slug=slug
               post.content=content
               db.session.commit()
               return redirect("/edit/"+serial_number)
        post = Post.query.filter_by(serial_number=serial_number).first()
        return render_template('edit.html', params=params,sno=serial_number,post=post)
@app.route("/delete/<string:serial_number>",methods=['GET','POST'])
def delete(serial_number):
    if ('user' in session and session['user'] == params['username']):
            post = Post.query.filter_by(serial_number=serial_number).first()
            db.session.delete(post)
            db.session.commit()
            return redirect("/dashboard")
app.run(debug=True)
