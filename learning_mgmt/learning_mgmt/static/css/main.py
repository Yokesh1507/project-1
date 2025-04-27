
from flask import Flask
from flask import Flask, render_template, Response, redirect, request, session, abort, url_for
import os
import base64
from PIL import Image
from datetime import datetime
from datetime import date
import datetime
import random
from random import seed
from random import randint
from werkzeug.utils import secure_filename
from flask import send_file
from PIL import Image, ImageDraw, ImageFont

import sys
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#nlp
import re
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from textblob import TextBlob

#from tokenizers import Tokenizer
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')

import threading
import time
import shutil
import hashlib
import urllib.request
import urllib.parse
from urllib.request import urlopen
import webbrowser
import mysql.connector
from sklearn.tree import DecisionTreeClassifier, export_text

import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, confusion_matrix
from wordcloud import WordCloud
import requests
from bs4 import BeautifulSoup
import pickle
from tensorflow.keras.models import save_model


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  charset="utf8",
  database="learning_mgmt"
)


app = Flask(__name__)
##session key
app.secret_key = 'abcdef'
UPLOAD_FOLDER = 'static/upload'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
#####

@app.route('/',methods=['POST','GET'])
def index():
    cnt=0
    act=""
    msg=""


    mycursor = mydb.cursor()
    '''df = pd.read_csv('processed_reviews.csv')
    for dd in df.values:
        mycursor.execute("SELECT max(id)+1 FROM ci_review_data")
        maxid = mycursor.fetchone()[0]
        if maxid is None:
            maxid=1
        
        now = date.today() #datetime.datetime.now()
        rdate=now.strftime("%d-%m-%Y")
        
        sql = "INSERT INTO ci_review_data(id,review_id,student_id,course_id,mentor_id,review_text,course_name,mentor_name,engagement,difficulty,relevance,expertise,processed_review,sentiment,estimated_rating) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        val = (maxid,dd[0],dd[1],dd[2],dd[3],dd[4],dd[5],dd[6],dd[7],dd[8],dd[9],dd[10],dd[11],dd[12],dd[13])
        mycursor.execute(sql, val)
        mydb.commit()'''

    '''mycursor.execute("SELECT * FROM ci_course")
    crow = mycursor.fetchall()
    for cr in crow:
        mycursor.execute("SELECT * FROM ci_review_data where course_id=%s",(cr[5],))
        rw = mycursor.fetchall()
        rate=0
        rat=0
        n=0
        for rw1 in rw:
            rat+=rw1[14]
            n+=1
        if rat>0:
            rat1=rat/n
            rate=round(rat1,2)
        else:
            rate=0
        #pos=2,neut=1,neg=0
        best_St=0
        if rate>3.14:
            best_st=2
        elif rate>2.4:
            best_st=1
        else:
            best_st=0
        mycursor.execute("update ci_course set star=%s,best_st=%s where course_st=%s",(rate,best_st,cr[5]))
        mydb.commit()'''
        

    return render_template('index.html',msg=msg,act=act)

@app.route('/login',methods=['POST','GET'])
def login():
    cnt=0
    act=""
    msg=""

    
    if request.method == 'POST':
        username1 = request.form['uname']
        password1 = request.form['pass']
        mycursor = mydb.cursor()
        mycursor.execute("SELECT count(*) FROM ci_student where uname=%s && pass=%s",(username1,password1))
        myresult = mycursor.fetchone()[0]
        print(myresult)
        if myresult>0:
            session['username'] = username1
            ff=open("user.txt",'w')
            ff.write(username1)
            ff.close()
            result=" Your Logged in sucessfully**"
            return redirect(url_for('stu_home')) 
        else:
            msg="Invalid Username or Password!"
            result="Your logged in fail!!!"
        

    return render_template('login.html',msg=msg,act=act)

@app.route('/login_ins',methods=['POST','GET'])
def login_ins():
    cnt=0
    act=""
    msg=""
    
    if request.method == 'POST':
        username1 = request.form['uname']
        password1 = request.form['pass']
        mycursor = mydb.cursor()
        mycursor.execute("SELECT count(*) FROM ci_user where uname=%s && pass=%s && status=1",(username1,password1))
        myresult = mycursor.fetchone()[0]
        print(myresult)
        if myresult>0:
            session['username'] = username1
            ff=open("user.txt",'w')
            ff.write(username1)
            ff.close()
            result=" Your Logged in sucessfully**"
            return redirect(url_for('staff_home')) 
        else:
            msg="Invalid Username or Password! or not approved"
            result="Your logged in fail!!!"
        

    return render_template('login_ins.html',msg=msg,act=act)

@app.route('/login_admin',methods=['POST','GET'])
def login_admin():
    cnt=0
    act=""
    msg=""
    if request.method == 'POST':
        
        username1 = request.form['uname']
        password1 = request.form['pass']
        mycursor = mydb.cursor()
        mycursor.execute("SELECT count(*) FROM ci_admin where username=%s && password=%s",(username1,password1))
        myresult = mycursor.fetchone()[0]
        if myresult>0:
            session['username'] = username1
            #result=" Your Logged in sucessfully**"
            return redirect(url_for('admin')) 
        else:
            msg="Your logged in fail!!!"
        

    return render_template('login_admin.html',msg=msg,act=act)

def pad_left(s, length):
    return s.zfill(length)

@app.route('/register', methods=['GET', 'POST'])
def register():
    msg=""
    act=request.args.get("act")
    mycursor = mydb.cursor()
    

    if request.method=='POST':
        name=request.form['name']
        address=request.form['address']
        mobile=request.form['mobile']
        email=request.form['email']
        uname=request.form['uname']
        pass1=request.form['pass']

        

        mycursor.execute("SELECT count(*) FROM ci_student where uname=%s",(uname,))
        myresult = mycursor.fetchone()[0]

        if myresult==0:
        
            mycursor.execute("SELECT max(id)+1 FROM ci_student")
            maxid = mycursor.fetchone()[0]
            if maxid is None:
                maxid=1
            
            now = date.today() #datetime.datetime.now()
            rdate=now.strftime("%d-%m-%Y")
            
            sql = "INSERT INTO ci_student(id,name,location,mobile,email,uname,pass,rdate) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
            val = (maxid,name,address,mobile,email,uname,pass1,rdate)
            mycursor.execute(sql, val)
            mydb.commit()

            
            print(mycursor.rowcount, "Registered Success")
            msg="success"
            
            #if cursor.rowcount==1:
            #    return redirect(url_for('index',act='1'))
        else:
            
            msg='fail'
            
    
    return render_template('register.html', msg=msg)

@app.route('/reg_ins', methods=['GET', 'POST'])
def reg_ins():
    msg=""
    act=request.args.get("act")
    mycursor = mydb.cursor()

    mycursor.execute("SELECT max(id)+1 FROM ci_user")
    maxid = mycursor.fetchone()[0]
    if maxid is None:
        maxid=1

    input_str = str(maxid)
    padded_str = pad_left(input_str, 3)
    m_id="M"+padded_str

    if request.method=='POST':
        name=request.form['name']
        address=request.form['address']
        mobile=request.form['mobile']
        email=request.form['email']
        quali=request.form['quali']
        uname=request.form['uname']
        pass1=request.form['pass']

        

        mycursor.execute("SELECT count(*) FROM ci_user where uname=%s",(uname,))
        myresult = mycursor.fetchone()[0]

        if myresult==0:
            
            now = date.today() #datetime.datetime.now()
            rdate=now.strftime("%d-%m-%Y")
            
            sql = "INSERT INTO ci_user(id,name,location,qualification,mobile,email,uname,pass,rdate) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
            val = (maxid,name,address,quali,mobile,email,uname,pass1,rdate)
            mycursor.execute(sql, val)
            mydb.commit()

            
            print(mycursor.rowcount, "Registered Success")
            msg="success"
            
            #if cursor.rowcount==1:
            #    return redirect(url_for('index',act='1'))
        else:
            
            msg='fail'
            
    
    return render_template('reg_ins.html', msg=msg,m_id=m_id)


@app.route('/admin', methods=['GET', 'POST'])
def admin():
    msg=""
    act=request.args.get("act")
    email=""
    mess=""
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user")
    data = mycursor.fetchall()

    if act=="yes":
        did=request.args.get("did")
        mycursor.execute("update ci_user set status=1 where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('admin'))
    if act=="no":
        did=request.args.get("did")
        mycursor.execute("update ci_user set status=2 where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('admin'))
        

        
    return render_template('admin.html',msg=msg,data=data,act=act)

def scrap_review():
    url = "https://coursereview.com/course-reviews"
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    # Assume reviews are in <div class="review"> and course name in <span class="course">
    reviews = []
    courses = []

    for review_div in soup.select('.review'):
        review_text = review_div.get_text(strip=True)
        course_name = review_div.select_one('.course').get_text(strip=True) if review_div.select_one('.course') else "Unknown"
        reviews.append(review_text)
        courses.append(course_name)

    # Create DataFrame
    df = pd.DataFrame({
        "Review_Text": reviews,
        "Course_Name": courses
    })

@app.route('/load_data', methods=['GET', 'POST'])
def load_data():
    msg=""
    act=request.args.get("act")
    data=[]

    cnt=0
    filename = 'static/dataset/course_recommend.csv'
    data1 = pd.read_csv(filename, header=0)
    data2 = list(data1.values.flatten())
    data=[]
    i=0
    sd=len(data1)
    rows=len(data1.values)
    
    #print(str(sd)+" "+str(rows))
    for ss in data1.values:
        cnt=len(ss)
        if i<200:        
            data.append(ss)
        i+=1
    cols=cnt
    
        
    return render_template('load_data.html',msg=msg,data=data,act=act)

def preprocess_text(text):
    # Convert to lowercase
    text = text.lower()
    
    # Remove special characters and numbers
    text = re.sub(r'[^a-zA-Z\s]', '', text)
    
    # Tokenization
    tokens = word_tokenize(text)
    
    # Remove stopwords
    stop_words = set(stopwords.words('english'))
    tokens = [word for word in tokens if word not in stop_words]
    
    # Lemmatization
    lemmatizer = WordNetLemmatizer()
    tokens = [lemmatizer.lemmatize(word) for word in tokens]
    
    return ' '.join(tokens)

def detect_sentiment(text):
    analysis = TextBlob(text)
    polarity = analysis.sentiment.polarity
    if polarity > 0.2:
        return 'Positive'
    elif polarity < -0.2:
        return 'Negative'
    else:
        return 'Neutral'

def estimate_rating(sentiment):
    if sentiment == 'Positive':
        return 4
    elif sentiment == 'Neutral':
        return 3
    else:
        return 1


@app.route('/preprocess', methods=['GET', 'POST'])
def preprocess():
    msg=""
    mem=0
    cnt=0
    cols=0
    filename = 'static/dataset/course_recommend.csv'
    data1 = pd.read_csv(filename, header=0)
    data2 = list(data1.values.flatten())
    cname=[]
    data=[]
    rdata=[]
    dtype=[]
    dtt=[]
    nv=[]
    i=0
    
    sd=len(data1)
    rows=len(data1.values)
    
    #print(data1.columns)
    col=data1.columns
    #print(data1[0])
    for ss in data1.values:
        cnt=len(ss)
        

    i=0
    while i<cnt:
        j=0
        x=0
        for rr in data1.values:
            dt=type(rr[i])
            if rr[i]!="":
                x+=1
            
            j+=1
        dtt.append(dt)
        nv.append(str(x))
        
        i+=1

    arr1=np.array(col)
    arr2=np.array(nv)
    data3=np.vstack((arr1, arr2))


    arr3=np.array(data3)
    arr4=np.array(dtt)
    
    data=np.vstack((arr3, arr4))
   
    print(data)
    cols=cnt
    mem=float(rows)*0.75
    #####
    '''df = pd.read_csv(filename, header=0)
    # Fill missing values
    df.fillna('NA', inplace=True)

    # Clean review text
    df['Cleaned_Review'] = df['Review_Text'].apply(clean_text)

    # Sentiment counts for visualization
    sentiment_counts = df['Sentiment'].value_counts()
    plt.figure(figsize=(6,4))
    sentiment_counts.plot(kind='bar', color=['green', 'gray', 'red'])
    plt.title("Sentiment Distribution")
    plt.xlabel("Sentiment")
    plt.ylabel("Count")
    plt.tight_layout()
    plt.savefig('static/sentiment_plot.png')
    plt.close()'''
    # Load dataset (Assuming CSV file with a 'Review_Text' column)
    df = pd.read_csv('static/dataset/course_recommend.csv')

    # Apply preprocessing
    df['Processed_Review'] = df['Review_Text'].apply(preprocess_text)

    # Save to new CSV file
    #df.to_csv('cleandata.csv', index=False)

    # Detect sentiment
    df['Sentiment'] = df['Processed_Review'].apply(detect_sentiment)

    # Estimate rating
    df['Estimated_Rating'] = df['Sentiment'].apply(estimate_rating)

    # Save to new CSV file
    #df.to_csv('processed_reviews.csv', index=False)

    #####
    filename1 = 'cleandata.csv'
    dat1 = pd.read_csv(filename1, header=0)
    dat2 = list(dat1.values.flatten())
    dat=[]
    i=0
    
    for ss in dat1.values:
        
        if i<200:        
            rdata.append(ss)
        i+=1

    return render_template('preprocess.html',data=data, msg=msg, rows=rows, cols=cols, dtype=dtype, mem=mem,rdata=rdata)


def extract_lexicon_features(text):
    blob = TextBlob(text)
    return pd.Series([blob.sentiment.subjectivity])
                     
@app.route('/feature', methods=['GET', 'POST'])
def feature():
    msg=""
    act=request.args.get("act")
    fdata=[]
    data=[]
    cnt=0
    filename = 'processed_reviews.csv'
    data1 = pd.read_csv(filename, header=0)
    data2 = list(data1.values.flatten())
    data=[]
    i=0
    sd=len(data1)
    rows=len(data1.values)
    
    #print(str(sd)+" "+str(rows))
    for ss in data1.values:
        cnt=len(ss)
        if i<200:        
            fdata.append(ss)
        i+=1
    cols=cnt

    ##########
    # Load dataset
    data = pd.read_csv('processed_reviews.csv')

    # Preprocess reviews
    data['Processed_Review'] = data['Review_Text'].apply(preprocess_text)

    # Sentiment & rating
    data['Sentiment'] = data['Processed_Review'].apply(detect_sentiment)
    data['Estimated_Rating'] = data['Sentiment'].apply(estimate_rating)

    # Lexicon features
    '''data[['Polarity', 'Subjectivity']] = pd.DataFrame(
        data['Processed_Review'].apply(extract_lexicon_features).tolist(),
        index=data.index
    )

    lex_features = data['Processed_Review'].apply(extract_lexicon_features)
    data[['Polarity', 'Subjectivity']] = pd.DataFrame(lex_features.values.tolist(), index=data.index)

    # Convert reviews to sequences (LSTM-ready)
    tokenizer = Tokenizer(num_words=5000, oov_token='<OOV>')
    tokenizer.fit_on_texts(data['Processed_Review'])
    sequences = tokenizer.texts_to_sequences(data['Processed_Review'])
    padded_sequences = pad_sequences(sequences, padding='post')'''

    # Save padded sequences to CSV
    #padded_df = pd.DataFrame(padded_sequences)
    #data.to_csv('processed_reviews2.csv', index=False)
    df = pd.read_csv('processed_reviews.csv')

    # ---------------------
    # Sentiment distribution
    plt.figure(figsize=(6,4))
    sns.countplot(data=df, x='Sentiment', palette='Set2')
    plt.title('Sentiment Distribution')
    #plt.savefig('static/graph/sentiment_distribution.png')
    #plt.show()

    # Polarity vs Subjectivity
    '''plt.figure(figsize=(7,5))
    sns.scatterplot(data=df, x='Polarity', y='Subjectivity', hue='Sentiment', palette='coolwarm')
    plt.title('Polarity vs Subjectivity by Sentiment')
    plt.savefig('static/polarity_subjectivity.png')
    plt.show()

    # WordCloud (optional)
    text = ' '.join(df['Processed_Review'].dropna())
    wc = WordCloud(width=800, height=400, background_color='white').generate(text)
    plt.figure(figsize=(10,5))
    plt.imshow(wc, interpolation='bilinear')
    plt.axis('off')
    plt.title('Word Cloud of Reviews')
    plt.savefig('static/wordcloud.png')
    plt.show()'''

  
        
    return render_template('feature.html',msg=msg,fdata=fdata,data=data,act=act)

#LSTM
def LSTM():
    df = pd.read_csv('processed_reviews.csv')
    # Convert sentiment to numeric
    df['Sentiment_Label'] = df['Sentiment'].map({'Negative': 0, 'Neutral': 1, 'Positive': 2})

    #label_encoder = LabelEncoder()
    #df['Sentiment_Label'] = label_encoder.fit_transform(df['Sentiment']) # Positive=2, Neutral=1, Negative=0
    tokenizer = Tokenizer(num_words=5000, oov_token="<OOV>")
    tokenizer.fit_on_texts(df['Review_Text'])
    sequences = tokenizer.texts_to_sequences(df['Review_Text'])
    padded = pad_sequences(sequences, padding='post', maxlen=100)


    X = padded
    y = df['Sentiment_Label'].values

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    #Build LSTM model
    model = Sequential()
    model.add(Embedding(input_dim=5000, output_dim=64, input_length=100))
    model.add(LSTM(64, return_sequences=False))
    model.add(Dense(3, activation='softmax')) # 3 classes: positive, neutral, negative

    model.compile(loss='sparse_categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
    model.fit(X_train, y_train, epochs=5, batch_size=32, validation_data=(X_test, y_test))
    loss, accuracy = model.evaluate(X_test, y_test)
    print(f"Test Accuracy: {accuracy:.2f}")

    y_pred_probs = model.predict(X_test)
    y_pred = np.argmax(y_pred_probs, axis=1)

    cm = confusion_matrix(y_test, y_pred)
    labels = label_encoder.classes_

    plt.figure(figsize=(6, 5))
    sns.heatmap(cm, annot=True, fmt="d", cmap="Blues", xticklabels=labels, yticklabels=labels)
    plt.xlabel("Predicted")
    plt.ylabel("Actual")
    plt.title("Confusion Matrix")
    plt.show()

    model.save("lstm_sentiment_model.h5")
    print("Model saved as lstm_sentiment_model.h5")
    
    
@app.route('/classify', methods=['GET', 'POST'])
def classify():
    msg=""
    act=request.args.get("act")
    data=[]
    data2=[]
    cnt=0
   
    ##
    df_csv = pd.read_csv('processed_reviews.csv')
    # Group by Course_Name and Sentiment, count number of reviews
    '''sentiment_by_course = df_csv.groupby(["Course_Name", "Sentiment"]).size().unstack(fill_value=0)

    # Plot
    sentiment_by_course.plot(kind="bar", stacked=True, figsize=(10, 6), colormap="Set2")
    plt.title("Sentiment Distribution by Course")
    plt.xlabel("Course Name")
    plt.ylabel("Number of Reviews")
    plt.xticks(rotation=45, ha='right')
    plt.tight_layout()
    plt.legend(title="Sentiment")
    plt.savefig('static/graph/g1.png')
    #plt.show()'''

    
    '''sentiment_by_mentor = df_csv.groupby(["Mentor_Name", "Sentiment"]).size().unstack(fill_value=0)

    # Plot
    sentiment_by_mentor.plot(kind="bar", stacked=True, figsize=(10, 6), colormap="Pastel1")
    plt.title("Sentiment Distribution by Mentor")
    plt.xlabel("Mentor Name")
    plt.ylabel("Number of Reviews")
    plt.xticks(rotation=45, ha='right')
    plt.tight_layout()
    plt.legend(title="Sentiment")
    plt.savefig('static/graph/g2.png')
    #plt.show()'''
    df = pd.read_csv('processed_reviews.csv')
    # Create the summary table
    summary = df.groupby("Mentor_Name").agg(
        Total_Reviews=("Sentiment", "count"),
        Positive_Reviews=("Sentiment", lambda x: (x == "Positive").sum()),
        Neutral_Reviews=("Sentiment", lambda x: (x == "Neutral").sum()),
        Negative_Reviews=("Sentiment", lambda x: (x == "Negative").sum()),
        Avg_Rating=("Estimated_Rating", "mean")
    ).round(2).reset_index()
    ####
    # Group by Course_Name
    summary2 = df.groupby("Course_Name").agg(
        Total_Reviews=("Sentiment", "count"),
        Positive_Reviews=("Sentiment", lambda x: (x == "Positive").sum()),
        Neutral_Reviews=("Sentiment", lambda x: (x == "Neutral").sum()),
        Negative_Reviews=("Sentiment", lambda x: (x == "Negative").sum()),
        Avg_Rating=("Estimated_Rating", "mean")
    ).round(2).reset_index()
    ##########
    # Example accuracy values over epochs (replace with your own)
    epochs = list(range(1, 11))  # 10 epochs
    train_accuracy = [0.65, 0.72, 0.78, 0.82, 0.85, 0.88, 0.89, 0.91, 0.92, 0.93]
    val_accuracy = [0.60, 0.68, 0.74, 0.79, 0.80, 0.83, 0.85, 0.86, 0.88, 0.87]

    # Plot accuracy
    plt.figure(figsize=(8, 5))
    plt.plot(epochs, train_accuracy, marker='o', label='Training Accuracy')
    plt.plot(epochs, val_accuracy, marker='s', label='Validation Accuracy')
    plt.title('LSTM Model Accuracy Over Epochs')
    plt.xlabel('Epochs')
    plt.ylabel('Accuracy')
    plt.ylim(0.5, 1.0)
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    #plt.savefig('static/graph/acc.png')
    #plt.show()
    

    return render_template('classify.html',msg=msg,data=summary.to_dict(orient='records'),data2=summary2.to_dict(orient='records'))

@app.route('/view_staff', methods=['GET', 'POST'])
def view_staff():
    msg=""
    act=request.args.get("act")
    email=""
    mess=""
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user order by id")
    data = mycursor.fetchall()

    if act=="yes":
        did=request.args.get("did")
        mycursor.execute("update ci_user set status=1 where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('view_staff'))
    if act=="no":
        did=request.args.get("did")
        mycursor.execute("update ci_user set status=2 where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('view_staff'))
   
    return render_template('view_staff.html',msg=msg,data=data,act=act)

@app.route('/view_stu', methods=['GET', 'POST'])
def view_stu():
    msg=""
    act=request.args.get("act")
    email=""
    mess=""
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_student order by id desc")
    data = mycursor.fetchall()

    if act=="yes":
        did=request.args.get("did")
        mycursor.execute("update ci_student set status=1 where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('view_stu'))
    if act=="no":
        did=request.args.get("did")
        mycursor.execute("update ci_student set status=2 where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('view_stu'))
        

        
    return render_template('view_stu.html',msg=msg,data=data,act=act)


@app.route('/view_cat', methods=['GET', 'POST'])
def view_cat():
    msg=""
    act=request.args.get("act")
    email=""
    mess=""
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_category")
    data = mycursor.fetchall()

    if request.method=='POST':
        category=request.form['category']

        mycursor.execute("SELECT max(id)+1 FROM ci_category")
        maxid = mycursor.fetchone()[0]
        if maxid is None:
            maxid=1
                
        sql = "INSERT INTO ci_category(id,category) VALUES (%s,%s)"
        val = (maxid,category)
        mycursor.execute(sql, val)
        mydb.commit()
        return redirect(url_for('view_cat'))

    if act=="del":
        did=request.args.get("did")
        mycursor.execute("delete FROM ci_category where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('view_cat'))
        
    
    return render_template('view_cat.html',msg=msg,data=data,act=act)

@app.route('/view_course', methods=['GET', 'POST'])
def view_course():
    msg=""
    act=request.args.get("act")
    email=""
    mess=""
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_category")
    data = mycursor.fetchall()

    mycursor.execute("SELECT * FROM ci_course")
    data2 = mycursor.fetchall()


    
    return render_template('view_course.html',msg=msg,data=data,data2=data2,act=act)

@app.route('/report', methods=['GET', 'POST'])
def report():
    msg=""
    act=request.args.get("act")
    email=""
    mess=""
    data2=[]
    mycursor = mydb.cursor()
    mycursor.execute("SELECT distinct(month) FROM ci_join")
    mdata = mycursor.fetchall()

    mycursor.execute("SELECT distinct(year) FROM ci_join")
    ydata = mycursor.fetchall()

    if request.method=='POST':
        month=request.form['month']
        year=request.form['year']
        mycursor.execute("SELECT * FROM ci_join where month=%s && year=%s",(month,year))
        data2 = mycursor.fetchall()

        
        
    
    return render_template('report.html',msg=msg,act=act,mdata=mdata,ydata=ydata,data2=data2)

@app.route('/staff_home', methods=['GET', 'POST'])
def staff_home():
    msg=""
    act=""
    email=""
    mess=""
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()

    
    return render_template('staff_home.html',msg=msg,data=data,act=act)
@app.route('/staff_report', methods=['GET', 'POST'])
def staff_report():
    msg=""
    act=""
    email=""
    mess=""
    data2=[]
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()
    mycursor.execute("SELECT distinct(month) FROM ci_join")
    mdata = mycursor.fetchall()

    mycursor.execute("SELECT distinct(year) FROM ci_join")
    ydata = mycursor.fetchall()

    if request.method=='POST':
        month=request.form['month']
        year=request.form['year']
        mycursor.execute("SELECT * FROM ci_join where month=%s && year=%s && staff=%s",(month,year,uname))
        data2 = mycursor.fetchall()

    
    return render_template('staff_report.html',msg=msg,act=act,mdata=mdata,ydata=ydata,data2=data2)

@app.route('/staff_edit', methods=['GET', 'POST'])
def staff_edit():
    msg=""
    act=""
    email=""
    mess=""
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()

    if request.method=='POST':
        name=request.form['name']
        address=request.form['address']
        mobile=request.form['mobile']
        email=request.form['email']
        quali=request.form['quali']
        skills=request.form['skills']
        pass1=request.form['pass']

        mycursor.execute("update ci_user set name=%s,location=%s,mobile=%s,email=%s,qualification=%s,pass=%s,skills=%s where uname=%s",(name,address,mobile,email,quali,pass1,skills,uname))
        mydb.commit()
        return redirect(url_for('staff_home'))
    
    return render_template('staff_edit.html',msg=msg,data=data,act=act)

@app.route('/staff_photo', methods=['GET', 'POST'])
def staff_photo():
    msg=""
    act=""
    email=""
    mess=""
    uname=""
    photo=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()
    uid=str(data[0])

    if request.method=='POST':
        file = request.files['file']
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file:
            fname = file.filename
            filename = secure_filename(fname)
            photo="P"+uid+filename
            file.save(os.path.join("static/photo", photo))

        mycursor.execute("update ci_user set photo=%s where uname=%s",(photo,uname))
        mydb.commit()
        return redirect(url_for('staff_home'))
    
    return render_template('staff_photo.html',msg=msg,data=data,act=act)

@app.route('/staff_tut', methods=['GET', 'POST'])
def staff_tut():
    msg=""
    act=request.args.get("act")
    email=""
    mess=""
    uname=""
    filename=""
    cid=request.args.get("cid")
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()
    uid=str(data[0])

    mycursor.execute("SELECT * FROM ci_course where id=%s",(cid,))
    dd = mycursor.fetchone()
    course=dd[3]

    if request.method=='POST':
        details=request.form['details']
        
        file = request.files['file']
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file:
            fname = file.filename
            filename1 = secure_filename(fname)
            filename="T"+uid+filename1
            file.save(os.path.join("static/upload", filename))

        mycursor.execute("SELECT max(id)+1 FROM ci_tutorial")
        maxid = mycursor.fetchone()[0]
        if maxid is None:
            maxid=1
                
        sql = "INSERT INTO ci_tutorial(id,uname,cid,course,details,filename) VALUES (%s,%s,%s,%s,%s,%s)"
        val = (maxid,uname,cid,course,details,filename)
        mycursor.execute(sql, val)
        mydb.commit()
        msg="ok"

    mycursor.execute("SELECT * FROM ci_tutorial where uname=%s",(uname,))
    data2 = mycursor.fetchall()

    if act=="del":
        did=request.args.get("did")
        mycursor.execute("delete from ci_tutorial where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('staff_tut',cid=cid))
    
    return render_template('staff_tut.html',msg=msg,data=data,data2=data2,act=act,cid=cid)

@app.route('/staff_course', methods=['GET', 'POST'])
def staff_course():
    msg=""
    act=""
    email=""
    mess=""
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT * FROM ci_category")
    cdata = mycursor.fetchall()

    if request.method=='POST':
        category=request.form['category']
        course=request.form['course']
        details=request.form['details']
        fees=request.form['fees']
        duration=request.form['duration']
        mycursor.execute("SELECT max(id)+1 FROM ci_course")
        maxid = mycursor.fetchone()[0]
        if maxid is None:
            maxid=1

        input_str = str(maxid)
        padded_str = pad_left(input_str, 3)
        m_id="C"+padded_str
            
        sql = "INSERT INTO ci_course(id,uname,category,course,details,course_st,fees,duration) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
        val = (maxid,uname,category,course,details,m_id,fees,duration)
        mycursor.execute(sql, val)
        mydb.commit()
        msg="ok"

    mycursor.execute("SELECT * FROM ci_course where uname=%s",(uname,))
    data2 = mycursor.fetchall()
    
    
    return render_template('staff_course.html',msg=msg,data=data,act=act,cdata=cdata,data2=data2)

@app.route('/staff_ques', methods=['GET', 'POST'])
def staff_ques():
    msg=""
    act=request.args.get("act")
    cid=request.args.get("cid")
    email=""
    mess=""
    uname=""
    cdaa=[]
    qdata=[]
    if 'username' in session:
        uname = session['username']

    if uname=="":
        uname=request.args.get("uname")
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT * FROM ci_course where uname=%s",(uname,))
    cdata = mycursor.fetchall()

    if act=="view":
        
        mycursor.execute("SELECT * FROM ci_question where cid=%s",(cid,))
        qdata = mycursor.fetchall()

    if request.method=='POST':
        question=request.form['question']
        option1=request.form['option1']
        option2=request.form['option2']
        option3=request.form['option3']
        option4=request.form['option4']
        answer=request.form['answer']
        qtype=request.form['qtype']
        
        mycursor.execute("SELECT max(id)+1 FROM ci_question")
        maxid = mycursor.fetchone()[0]
        if maxid is None:
            maxid=1
        
        now = date.today() #datetime.datetime.now()
        rdate=now.strftime("%d-%m-%Y")
        
        sql = "INSERT INTO ci_question(id,cid,question,option1,option2,option3,option4,answer,qtype) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        val = (maxid,cid,question,option1,option2,option3,option4,answer,qtype)
        mycursor.execute(sql, val)
        mydb.commit()

        
        print(mycursor.rowcount, "Registered Success")
        msg="success"

    if act=="del":    
        did=request.args.get("did")
        mycursor.execute("delete from ci_question where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('staff_ques',act='view',cid=cid))
    
    return render_template('staff_ques.html',msg=msg,data=data,act=act,cdata=cdata,qdata=qdata,uname=uname,cid=cid)

@app.route('/staff_ques1', methods=['GET', 'POST'])
def staff_ques1():
    msg=""
    act=request.args.get("act")
    cid=request.args.get("cid")
    email=""
    mess=""
    uname=""
    cdaa=[]
    qdata=[]
    fn=""
    if 'username' in session:
        uname = session['username']

    if uname=="":
        uname=request.args.get("uname")
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT * FROM ci_course where uname=%s",(uname,))
    cdata = mycursor.fetchall()

    if act=="view":
        
        mycursor.execute("SELECT * FROM ci_question where cid=%s",(cid,))
        qdata = mycursor.fetchall()

    if request.method=='POST':
        file = request.files['file']

        ff=file.filename
        fn1=ff.split(".")
        fn=fn1[0]+".txt"
        msg="ok"


    return render_template('staff_ques1.html',msg=msg,fn=fn,data=data,act=act,cdata=cdata,qdata=qdata,uname=uname,cid=cid)

@app.route("/read_file", methods=["GET","POST"])
def read_file():
    content=""
   
        
    filename = request.args.get("fn")
    filepath = "static/upload/"+filename

    if os.path.exists(filepath):
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

    return render_template("read_file.html", content=content, filename=filename)


   
@app.route('/staff_exam', methods=['GET', 'POST'])
def staff_exam():
    msg=""
    act=request.args.get("act")
    cid=request.args.get("cid")
    mycursor = mydb.cursor()
    

    if request.method=='POST':
        
        num_question=request.form['num_question']
        mark=request.form['mark']
        
        
        mycursor.execute("SELECT max(id)+1 FROM ci_exam")
        maxid = mycursor.fetchone()[0]
        if maxid is None:
            maxid=1
        
        now = date.today() #datetime.datetime.now()
        rdate=now.strftime("%d-%m-%Y")
        
        sql = "INSERT INTO ci_exam(id,sid,num_question,mark) VALUES (%s,%s,%s,%s)"
        val = (maxid,cid,num_question,mark)
        mycursor.execute(sql, val)
        mydb.commit()

        mycursor.execute("SELECT count(*) FROM ci_join where cid=%s",(cid,))
        sd = mycursor.fetchone()[0]
        if sd>0:
            
            mycursor.execute("update ci_join set exam_id=%s where cid=%s",(maxid,cid))
            mydb.commit()
            
        
        msg="success"
        
        #if cursor.rowcount==1:
        #    return redirect(url_for('index',act='1'))

    mycursor.execute("SELECT * FROM ci_exam where sid=%s",(cid,))
    data = mycursor.fetchall()


    if act=="del":
        did=request.args.get("did")
        mycursor.execute("SELECT count(*) FROM ci_join where exam_id=%s",(did,))
        sn = mycursor.fetchone()[0]
        if sn>0:
            mycursor.execute("update ci_join set exam_id=0 where exam_id=%s",(did,))
            mydb.commit()
        mycursor.execute("delete from ci_exam where id=%s",(did,))
        mydb.commit()
        return redirect(url_for('staff_exam',cid=cid)) 
    
    return render_template('staff_exam.html', msg=msg,data=data,cid=cid)



@app.route('/page', methods=['GET', 'POST'])
def page():
    msg=""
    act=""
    email=""
    cid=request.args.get("cid")
    mess=""
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_student where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("update ci_join set seconds=seconds+20 where uname=%s && cid=%s",(uname,cid))
    mydb.commit()
    
    
    return render_template('page.html',msg=msg,data=data,act=act,cid=cid)



@app.route('/meetapi',methods=['POST','GET'])
def meetapi():
    msg=""

    return render_template('meetapi.html',msg=msg)

@app.route('/stu_course', methods=['GET', 'POST'])
def stu_course():
    msg=""
    act=""
    email=""
    mess=""
    data2=[]
    data3=[]
    st=""
    st2=""
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_student where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT count(*) FROM ci_course c,ci_user u where c.uname=u.uname && c.best_st>=1 order by c.star desc")
    c1 = mycursor.fetchone()[0]
    if c1>0:
        st="1"
        mycursor.execute("SELECT * FROM ci_course c,ci_user u where c.uname=u.uname && c.best_st>=1 order by c.star desc")
        data2 = mycursor.fetchall()


    mycursor.execute("SELECT count(*) FROM ci_course c,ci_user u where c.uname=u.uname && c.best_st=0")
    c2 = mycursor.fetchone()[0]
    if c2>0:
        st2="1"
        mycursor.execute("SELECT * FROM ci_course c,ci_user u where c.uname=u.uname && c.best_st=0")
        data3 = mycursor.fetchall()

    
    return render_template('stu_course.html',msg=msg,data=data,data2=data2,data3=data3,act=act,st=st,st2=st2)

@app.route('/stu_status', methods=['GET', 'POST'])
def stu_status():
    msg=""
    act=request.args.get("act")
    uname=""
    if 'username' in session:
        uname = session['username']

    if uname=="":
        name=request.args.get("name")
        session['username'] = name
        
    mycursor = mydb.cursor()

    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()


    mycursor.execute("SELECT * FROM ci_exam c,ci_exam_attend e where c.id=e.eid && e.uname=%s",(uname,))
    data1 = mycursor.fetchall()

    if act=="del":
        eid=request.args.get("eid")
        sid=request.args.get("sid")
        mycursor.execute("delete from ci_temp where eid=%s && uname=%s",(eid,uname))
        mydb.commit()
        mycursor.execute("delete from ci_exam_attend where eid=%s && uname=%s",(eid,uname))
        mydb.commit()
        return redirect(url_for('stu_status'))
        

    return render_template('stu_status.html', msg=msg,act=act,data=data,uname=uname,data1=data1)

@app.route('/stu_testdet', methods=['GET', 'POST'])
def stu_testdet():
    msg=""
    st=""
    data1=[]
    act=request.args.get("act")
    eid=request.args.get("eid")
    uname=""
    if 'username' in session:
        uname = session['username']

    if uname=="":
        name=request.args.get("name")
        session['username'] = name
        
    mycursor = mydb.cursor()

    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT count(*) FROM ci_exam c,ci_exam1 e where c.id=e.eid && e.uname=%s",(uname,))
    nn = mycursor.fetchone()[0]
    if nn>0:
        st="1"
        mycursor.execute("SELECT * FROM ci_exam c,ci_exam1 e where c.id=e.eid && e.uname=%s",(uname,))
        data1 = mycursor.fetchall()
    else:
        st="2"

    mycursor.execute("SELECT * FROM ci_temp where uname=%s && eid=%s",(uname,eid))
    data3 = mycursor.fetchall()

    return render_template('stu_testdet.html', msg=msg,data=data,uname=uname,data1=data1,st=st,data3=data3)


@app.route('/stu_pay', methods=['GET', 'POST'])
def stu_pay():
    msg=""
    rid=request.args.get("rid")
    act=""
    email=""
    mess=""
    eid=0
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_student where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT * FROM ci_join where id=%s",(rid,))
    dd = mycursor.fetchone()
    fees=dd[4]
    paid=dd[7]
    cid=dd[3]

    if request.method=='POST':
        pmode=request.form['pmode']
        amount=request.form['amount']
        amt=int(amount)
        amt1=paid+amt

      
        if amt1<=fees:
            
            mycursor.execute("update ci_join set paid=%s where id=%s",(amt1,rid))
            mydb.commit()

            mycursor.execute("SELECT * FROM ci_join where id=%s",(rid,))
            dd4 = mycursor.fetchone()
            if dd4[4]==dd4[7]:
                mycursor.execute("SELECT * FROM ci_exam where sid=%s order by id",(cid,))
                gg = mycursor.fetchall()
                for gg1 in gg:
                    eid=gg1[0]
                mycursor.execute("update ci_student set eid=%s where uname=%s",(eid,uname))
                mydb.commit()
    
                mycursor.execute("update ci_join set exam_id=%s where id=%s",(eid,rid))
                mydb.commit()
            msg="ok"
        else:
            msg="fail"

    
    return render_template('stu_pay.html',msg=msg,data=data,act=act,rid=rid)

@app.route('/stu_tut', methods=['GET', 'POST'])
def stu_tut():
    msg=""
    cid=request.args.get("cid")
    act=""
    email=""
    mess=""
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_student where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT * FROM ci_course where id=%s",(cid,))
    data1 = mycursor.fetchone()
    course=data1[3]

    mycursor.execute("SELECT * FROM ci_tutorial where cid=%s",(cid,))
    data2 = mycursor.fetchall()
    
    return render_template('stu_tut.html',msg=msg,data=data,act=act,cid=cid,data2=data2,course=course)

@app.route('/staff_status', methods=['GET', 'POST'])
def staff_status():
    msg=""
    act=request.args.get("act")
    cid=request.args.get("cid")
    uname=""
    if 'username' in session:
        uname = session['username']

    if uname=="":
        name=request.args.get("name")
        session['username'] = name
        
    mycursor = mydb.cursor()

    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()


    mycursor.execute("SELECT * FROM ci_exam c,ci_exam_attend e where c.id=e.eid && e.sid=%s",(cid,))
    data1 = mycursor.fetchall()

   
        

    return render_template('staff_status.html', msg=msg,act=act,data=data,uname=uname,data1=data1)

@app.route('/staff_testdet', methods=['GET', 'POST'])
def staff_testdet():
    msg=""
    st=""
    data1=[]
    act=request.args.get("act")
    eid=request.args.get("eid")
    cid=request.args.get("cid")
    user=request.args.get("user")
    uname=""
    if 'username' in session:
        uname = session['username']

    if uname=="":
        name=request.args.get("name")
        session['username'] = name
        
    mycursor = mydb.cursor()

    mycursor.execute("SELECT * FROM ci_user where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT count(*) FROM ci_exam c,ci_exam1 e where c.id=e.eid && e.sid=%s",(cid,))
    nn = mycursor.fetchone()[0]
    if nn>0:
        st="1"
        mycursor.execute("SELECT * FROM ci_exam c,ci_exam1 e where c.id=e.eid && e.sid=%s",(cid,))
        data1 = mycursor.fetchall()
    else:
        st="2"

    mycursor.execute("SELECT * FROM ci_temp where uname=%s && eid=%s",(user,eid))
    data3 = mycursor.fetchall()

    return render_template('staff_testdet.html', msg=msg,data=data,uname=uname,data1=data1,st=st,data3=data3)


@app.route('/stu_review', methods=['GET', 'POST'])
def stu_review():
    msg=""
    rid=request.args.get("rid")
    act=""
    email=""
    mess=""
    pos_st=0
    neg_st=0
    uname=""
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_student where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT * FROM ci_join where id=%s",(rid,))
    dd = mycursor.fetchone()
    cid=dd[3]
    staff=dd[2]
  
    now = date.today() #datetime.datetime.now()
    rdate=now.strftime("%d-%m-%Y")
    
    if request.method=='POST':
        review=request.form['review']
        star=request.form['star']

        
    
        ##
        f1=open("static/data_pos.txt","r")
        txt1=f1.read()
        f1.close()

        f1=open("static/data_neg.txt","r")
        txt2=f1.read()
        f1.close()
        #nlp

        #sys.argv[1]
        with open("static/data_pos.txt", 'r') as file1:
             sentence=file1.read()
        special_characters = ['!','"','#','$','%','&','(',')','*','+','/',':',';','<','=','>','@','[','\\',']','^','`','{','|','}','~','\t']

        x=0
        y=0
        '''for i in special_characters : 
             sentence = sentence.replace(i, '')
             print(sentence)

               
            if sentence in txt1:                
                pos_st=1
                print("Found!")
                x+=1
            else:
                neg_st=0
                print("Not found!")

        
        ##
        for i in special_characters : 
             sentence = sentence.replace(i, '')
             print(sentence)


        if sentence in txt1:
            
            pos_st=1
            print("Found!")
            
        else:
            neg_st=1
            print("Not found!")
            x+=1
        print(x)     '''
        nlp_txt1=txt1.split(',')
        for tx in nlp_txt1:
            if tx in review:
                x+=1
        nlp_txt2=txt2.split(',')
        for tx2 in nlp_txt2:
            if tx2 in review:
                y+=1
        if x>0:
            pos_st=1

        if y>0:
            neg_st=1
        ##

        mycursor.execute("SELECT count(*) FROM ci_reviews where uname=%s && join_id=%s",(uname,rid))
        dr1 = mycursor.fetchone()[0]
        if dr1==0:
            mycursor.execute("SELECT max(id)+1 FROM ci_reviews")
            maxid = mycursor.fetchone()[0]
            if maxid is None:
                maxid=1
                    
            sql = "INSERT INTO ci_reviews(id,uname,staff,cid,join_id,reviews,star,rdate,pos_st,neg_st) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
            val = (maxid,uname,staff,cid,rid,review,star,rdate,pos_st,neg_st)
            mycursor.execute(sql, val)
            mydb.commit()
            msg="ok"
        else:
            mycursor.execute("update ci_reviews set reviews=%s,star=%s,pos_st=%s,neg_st=%s where uname=%s && join_id=%s",(review,star,pos_st,neg_st,uname,rid))
            mydb.commit()

            mycursor.execute("SELECT count(*),sum(star) FROM ci_reviews where cid=%s",(cid,))
            val = mycursor.fetchone()
            scount=val[0]
            tot_star=val[1]
            v=tot_star/scount
            v1=int(v)

            x=0
            y=0
            n=0
            best="0"
            mycursor.execute("SELECT * FROM ci_reviews where cid=%s",(cid,))
            dr = mycursor.fetchall()
            for dr1 in dr:
                if dr1[8]==1:
                    x+=1
                if dr1[9]==1:
                    y+=1
                n+=1

            pos=(x/n)*100
            pos1=round(pos,2)
            neg=(y/n)*100
            neg1=round(neg,2)

            if pos>neg:
                best="1"

            mycursor.execute("update ci_course set star=%s,best_st=%s,score=%s where id=%s",(v1,best,pos1,cid))
            mydb.commit()
            
            msg="ok"
        
    
    return render_template('stu_review.html',msg=msg,data=data,act=act,rid=rid)

@app.route('/reviews', methods=['GET', 'POST'])
def reviews():
    msg=""
    cid=request.args.get("cid")
    act=""
    email=""
    mess=""
    uname=""
    pos=0
    neu=0
    neg=0
    if 'username' in session:
        uname = session['username']
        
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM ci_student where uname=%s",(uname,))
    data = mycursor.fetchone()

    mycursor.execute("SELECT * FROM ci_course where course_st=%s",(cid,))
    d1 = mycursor.fetchone()
    sfid=d1[1]
    mycursor.execute("SELECT * FROM ci_user where uname=%s",(sfid,))
    d2 = mycursor.fetchone()
    sname=d2[1]

    mycursor.execute("SELECT * FROM ci_review_data where course_id=%s",(cid,))
    data2 = mycursor.fetchall()

    mycursor.execute("SELECT count(*) FROM ci_review_data where course_id=%s",(cid,))
    cn1 = mycursor.fetchone()[0]

    mycursor.execute("SELECT count(*) FROM ci_review_data where course_id=%s && sentiment='Positive'",(cid,))
    cn2 = mycursor.fetchone()[0]

    mycursor.execute("SELECT count(*) FROM ci_review_data where course_id=%s && sentiment='Neutral'",(cid,))
    cn3 = mycursor.fetchone()[0]

    mycursor.execute("SELECT count(*) FROM ci_review_data where course_id=%s && sentiment='Negative'",(cid,))
    cn4 = mycursor.fetchone()[0]

    p1=(cn2/cn1)*100
    pos=round(p1,2)

    p2=(cn3/cn1)*100
    neu=round(p2,2)

    p3=0
    if cn4>0:
        p3=(cn4/cn1)*100
        neg=round(p3,2)


    

    return render_template('reviews.html',msg=msg,data=data,data2=data2,d1=d1,act=act,cid=cid,pos=pos,neg=neg,neu=neu)

@app.route('/down', methods=['GET', 'POST'])
def down():
    fn = request.args.get('fname')
    path="static/upload/"+fn
    return send_file(path, as_attachment=True)



@app.route('/logout')
def logout():
    # remove the username from the session if it is there
    session.pop('username', None)
    return redirect(url_for('index'))


if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True,host='0.0.0.0', port=5000)
