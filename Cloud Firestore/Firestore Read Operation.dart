import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestoreread extends StatefulWidget {
  @override
  _FirestorereadState createState() => _FirestorereadState();
}

class _FirestorereadState extends State<Firestoreread> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Mode'),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection('animated').snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: LinearProgressIndicator());
          }
          else{
            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot documentSnapshot){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(documentSnapshot.data()['image']),
                    ),
                    title: Text(documentSnapshot.data()['name']),
                    subtitle: Text(documentSnapshot.data()['year']),
                  )
                );
              }).toList()
            );
          }
        },
      ),
    );
  }
}
