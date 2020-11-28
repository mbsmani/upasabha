import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class nameCard extends StatelessWidget {

  String name = "" ;
  String address = "";
  String age="";
  String bldgp = "";
  String email = "";
  String mobno = "";

  String gothram ="";
  String vedam ="";
  String famMemId;
  nameCard(this.name,this.address,this.age,this.bldgp,this.email,this.mobno,this.vedam,this.gothram, this.famMemId);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(bldgp),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => bottomSheet(context),
    );
  }

  void bottomSheet(context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext bc){
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  title: Text(this.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
                Divider(
                  height: 0.0,
                  color: Colors.black54,
                  endIndent: 10.0,
                  indent: 10.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text("Address:", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),),
                        subtitle: Text(this.address),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ListTile(
                              title: Text("Age:", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                              subtitle: Text(this.age),
                            ),
                          ListTile(
                              title: Text("Blood Group:", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                              subtitle: Text(this.bldgp),
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
                Divider(
                  height: 0.0,
                  color: Colors.black54,
                  endIndent: 10.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(this.email, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(mobno, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                ),
                Divider(
                  height: 0.0,
                  color: Colors.black54,
                  endIndent: 10.0,
                  indent: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text("Vedam:", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                        subtitle: Text(this.vedam, style: TextStyle(fontStyle: FontStyle.italic),),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("Gothram:", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                        subtitle: Text(this.gothram, style: TextStyle(fontStyle: FontStyle.italic),),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 0.0,
                  color: Colors.black54,
                  endIndent: 10.0,
                  indent: 10.0,
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text("Family Members"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => familyMembers(this.famMemId))),
                ),
              ],
            ),
          );
        }
    );
  }
}

class familyMembers extends StatelessWidget {

  final Firestore fb = Firestore.instance;
  String famId;
  String name;
  String bldgp;
  String age;
  String relation;

  familyMembers(this.famId);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Family Details"), centerTitle: true,),
        body: FutureBuilder(
          future: getFamMembers(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              return ListView.separated(
                  itemCount: snapshot.data.documents.length ,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    height: 1.0,
                    color: Colors.blueAccent,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index){
                    name=snapshot.data.documents[index].data["Name"];
                    age=snapshot.data.documents[index].data["age"];
                    bldgp=snapshot.data.documents[index].data["bldgp"];
                    relation=snapshot.data.documents[index].data["relation"];
                    return Container(
                      height: 220,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("     Name: $name", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                          Text("     Age: $age", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                          Text("     Blood Group: $bldgp", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                          Text("     Relation: $relation",  textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                        ],
                      ),
                    );
                  }
              );
            }
            else if(snapshot.connectionState==ConnectionState.none){
              return Text(
                "No Family Members....",
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

  Future<QuerySnapshot> getFamMembers() {
    return fb.collection("Members").document(famId).collection("Family Members").orderBy("age", descending:true).getDocuments();
  }
}
