import 'package:flutter/material.dart';
import 'package:todolist/Screens/login_page.dart';
import 'package:todolist/Utils/sign_in.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 60.0,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40.0,),
              Text(
                'NAME',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'EMAIL',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 40.0,),
              RaisedButton(
                onPressed: (){
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){return LoginPage();}), ModalRoute.withName('/'));
                },
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}