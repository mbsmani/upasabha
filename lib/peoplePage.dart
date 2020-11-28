import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'nameCard.dart';

class peoplePage extends StatefulWidget {
  @override
  _peoplePageState createState() => _peoplePageState();
}

class _peoplePageState extends State<peoplePage> {

  final Firestore fb = Firestore.instance;
  //Future<QuerySnapshot> memFamilysnapshot;
  String id;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Member Details"), centerTitle: true,),
          body: FutureBuilder(
            future: getMembers(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState==ConnectionState.done){
                return ListView.builder(
                    itemCount: snapshot.data.documents.length ,
                    itemBuilder: (BuildContext context, int index){
                      id = snapshot.data.documents[index].documentID.toString();
                      return nameCard(snapshot.data.documents[index].data["Name"],
                        snapshot.data.documents[index].data["address"],
                        snapshot.data.documents[index].data["age"],
                        snapshot.data.documents[index].data["bldgp"],
                        snapshot.data.documents[index].data["email"],
                        snapshot.data.documents[index].data["mobno"],
                        snapshot.data.documents[index].data["vedam"],
                        snapshot.data.documents[index].data["gothram"],
                        id
                      );
                    }
                );
              }
              else if(snapshot.connectionState==ConnectionState.none){
                return Text(
                  "No Blogs Yet....",
                  style: TextStyle(color: Colors.blueAccent, fontStyle: FontStyle.italic),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
    );
  }

  /*Future<QuerySnapshot> getFamMembers(String i) {
    return fb.collection("Members").document(i).collection("Family Members").getDocuments();
  }*/

  Future<QuerySnapshot> getMembers() {
    return fb.collection("Members").orderBy("Name").getDocuments();
  }
}