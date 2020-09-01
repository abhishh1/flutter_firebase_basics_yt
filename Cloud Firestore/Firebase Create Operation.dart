import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mango/Read.dart';

class FirebaseOperations extends StatefulWidget {
  @override
  _FirebaseOperationsState createState() => _FirebaseOperationsState();
}

class _FirebaseOperationsState extends State<FirebaseOperations> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            await FirebaseFirestore.instance.collection('NewData').add({
              'data':textEditingController.text
            });
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.update,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text('Create Mode'),
          actions: [
            FlatButton.icon(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Firestoreread())),
                icon: Icon(
                  Icons.chrome_reader_mode,
                  color: Colors.white,
                ),
                label: Text(
                  "Read Mode",
                  style: TextStyle(color: Colors.white),
                ))
          ],
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Padding(
              padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: 'Start typing...',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold)),
              )),
        ));
  }
}
