var express = require("express");
var app     = express();
var path    = require("path");
var mysql = require('mysql');
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

var awsParameterStoreEnv = require("aws-parameter-store-env")
var con;

// hammad-test-portion start here
require("aws-parameter-store-env")
  .config({
    path: "/test/cred/",
    parameters: [
      {
        name: "DB_HOST",
        envName: "DB_HOST"
      },
      {
        name: "DB_USER",
        envName: "DB_USER"
      },
      {
        name: "DB_PASS",
        envName: "DB_PASS"
      },
      {
        name: "DB_NAME",
        envName: "DB_NAME"
      }
    ],
    region: "us-west-2"
  })
  .then(() => {
    const { DB_HOST, DB_USER, DB_PASS, DB_NAME } = process.env;
    
    console.log({
        DB_HOST,
        DB_USER,
        DB_NAME
    })

    // code to run after the environment has been configured
    con = mysql.createConnection({
     host : DB_HOST,
     user : DB_USER,
     password : DB_PASS,
     database : DB_NAME
    });
  });
// hammad-test-portion end here


app.get('/',function(req,res){
  res.sendFile(path.join(__dirname+'/index.html'));
});
app.post('/',function(req,res){

  var userName=req.body.userName;
  var emailId=req.body.emailId;
  var phoneNo=req.body.phoneNo;
  var password=req.body.password;
var moment = require('moment');
var reg_date = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
  res.write('You sent the name "' + req.body.userName+'".\n');
  res.write('You sent the email "' + req.body.emailId+'".\n');
  res.write('You sent the password "' + req.body.password+'".\n');

  con.connect(function(err) {
  if (err) throw err;
  var sql = "INSERT INTO userData (userName, emailId,phoneNo,password,reg_date) VALUES ('"+userName+"', '"+emailId+"','"+phoneNo+"', '"+password+"','"+reg_date+"')";
  con.query(sql, function (err, result) {
    if(err){  //we make sure theres an error (error obj)

          if(err.errno==1062){

  var sql = 'UPDATE userData SET userName ="' + req.body.userName+'",phoneNo="'+ req.body.phoneNo+'",password="' + req.body.password+'" WHERE emailId ="'+ req.body.emailId+'"';
  con.query(sql, function (err, result) {
  if (err) throw err;
  console.log(result.affectedRows + " record(s) updated");
  });
          res.end();

      }
          else{
              throw err;
          res.end();
        }
  }
    console.log("1 record inserted");
     res.end();
  });
  });
});
app.post('/search',function(req,res){
    var emailId=req.body.emailIs;
    console.log(emailId);
      res.write('You sent the email "' + req.body.emailIs+'".\n');
      con.connect(function(err) {
if (err) throw err;
con.query('SELECT * FROM userData WHERE emailId ="'+ req.body.emailIs+'"', function (err, result) {
if (err) throw err;
console.log(result);
});
});
});
app.listen(80);
console.log("Running at Port 80");
