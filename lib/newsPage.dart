import 'blogCard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(newsPage());
}

class newsPage extends StatefulWidget {
  @override
  _newsPageState createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {

  final Firestore fb = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text("News and Events"),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: getBlogs(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState==ConnectionState.done){
                return ListView.builder(
                    itemCount: snapshot.data.documents.length ,
                    itemBuilder: (BuildContext context, int index){
                      return blogCard(snapshot.data.documents[index].data["description"], snapshot.data.documents[index].data["title"], snapshot.data.documents[index].data["url"]);
                    }
                );
              }
              else if(snapshot.connectionState==ConnectionState.none){
                return Text(
                  "No News Yet....",
                  style: TextStyle(color: Colors.blueAccent, fontStyle: FontStyle.italic),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
    );
  }

  Future<QuerySnapshot> getBlogs() {
    return fb.collection("News").getDocuments();
  }
}