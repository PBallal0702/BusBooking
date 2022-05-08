from flask import Flask,render_template,request
import pymysql
import json
from flask_cors import CORS
# select * from buslist as bl join booking as b on bl.id = b.busid where b.userid =2 ;
conn = pymysql.connect(
        host='mybusbooking.cc2zgenujylf.us-east-1.rds.amazonaws.com',
        user='admin', 
        password = "Ballal123",
        db='bus_booking',
        )
      
# cur = conn.cursor()
# cur.execute("""insert into `users` (`fname`,`username`,`email`, `password`) value ("Admin","Admin","admin@gmail.com","Admin")""")
# conn.commit()
# output = cur.fetchall()
# print(output)
  
# # To close the connection
# conn.close()

app = Flask(__name__,template_folder='template')

CORS(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/profile/<id>')
def profile(id):
    id = int(id)
    cur = conn.cursor()
    query = "SELECT * from `buslist` as bl join `booking` as b on bl.id = b.busid where b.userid =" + str(id)
    cur.execute(query)
    output = cur.fetchall()
    output = list(output)
    output_list = []
    for op in output:
        x = list(op)
        output_list.append(x)
    return render_template('profile.html',data=output_list)
    
@app.route('/index',methods=['POST'])
def indexPost():
    my_json = request.data.decode('utf8').replace("'", '"')
    data = json.loads(my_json)
    cur = conn.cursor()
    source = data['from']
    to = data['to']
    query = "SELECT * FROM `buslist` WHERE `from`=%s AND `to` =%s"
    cur.execute(query,(source,to))
    output = cur.fetchall()
    output = list(output)
    output_list = []
    for op in output:
        x = list(op)
        output_list.append(x)
    
    return {"data":output_list}

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/login',methods=['POST'])
def loginPost():
    my_json = request.data.decode('utf8').replace("'", '"')
    data = json.loads(my_json)
    print(data)
    cur = conn.cursor()
    username = data['username']
    password = data['password']
    query = "SELECT * FROM `users` WHERE `username`=%s AND `password` =%s"
    cur.execute(query,(username,password))
    output = cur.fetchall()
    output = list(output)
    output_list = []
    for op in output:
        x = list(op)
        output_list.append(x)
    if(len(output_list) > 0 ):
        user_info = output_list[0]
        print(user_info)
        return dict({"data":user_info})
    else:
        return "0"
    
    

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/register',methods=['POST'])
def registerPost():
    my_json = request.data.decode('utf8').replace("'", '"')
    data = json.loads(my_json)
    print(data)
    cur = conn.cursor()
    fname = data['fname']
    email = data['email']
    username = data['username']
    password = data['password']
    query = "INSERT INTO `users` (`fname`,`email`,`username`,`password`) value (%s,%s,%s,%s)"
    cur.execute(query,(fname,email,username,password))
    conn.commit()
    output = cur.fetchall()
    print(output)
    return "Success"



@app.route('/available-bus/')
def available():
    data = request.args.to_dict(flat=False)
    data = data['data'][0]
    data = json.loads(data)
    data = data['data']
    print(data)
    print(type(data))
    return render_template('buslist.html',data=data)
@app.route('/book')
def confirm_book():
    data = request.args.to_dict(flat=False)
    data = data['data'][0]
    data = json.loads(data)
    data = dict({"data":data})
    print(data)
    print(type(data))
    return render_template('book.html',data=data)

@app.route('/bookPost',methods=["Post"])
def bookPost():
    my_json = request.data.decode('utf8').replace("'", '"')
    data = json.loads(my_json)
    
    userid = data['userid']
    busid = data['busid']
    time = data['time']
    query = "INSERT into `booking` (`userid`,`busid`,`time`) value (%s,%s,%s)"
    cur = conn.cursor()
    cur.execute(query,(userid,busid,time))
    conn.commit()
    output = cur.fetchall()
    print(output)
    
    return "success"

@app.route('/confirm')
def confirm():
    return render_template('confirm.html')

if __name__ == "__main__":
    app.run(debug=True)