import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Nama',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage('https://www.petanikode.com/img/flutter/flutter.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Logout'),
            onTap: () => {},
          )
        ],
      ),
    );
  }
}