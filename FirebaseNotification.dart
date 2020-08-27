import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationDemo extends StatefulWidget {
  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  final _firebaseMessaging = FirebaseMessaging();
  String _message = 'Generating Message...';
  String _token = 'Generating Token...';

  void initState(){
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String,dynamic> message) async{
        setState(() {
          _message = '$message';
        });
      },
      onLaunch: (Map<String,dynamic> message) async{
        setState(() {
          _message = '$message';
        });
      },
      onResume: (Map<String,dynamic> message) async{
        setState(() {
          _message = '$message';
        });
      },
      
    );

    _firebaseMessaging.getToken().then((String token){
      assert(token != null);
      setState(() {
        _token = '$token';
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Firebase Notification'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(_token),
              Divider(),
              Text(_message)
            ],
          ),
        ),
      ),
    );
  }
}
