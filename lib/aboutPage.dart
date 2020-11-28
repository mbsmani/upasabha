import 'package:flutter/material.dart';

class aboutPage extends StatefulWidget {
  @override
  _aboutPageState createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Karamana Upasabha"), centerTitle: true,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //logo
            SizedBox(height: 10.0,),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              height: 150.0,
              width: 125.0,
              child: Image.asset("assets/appimages/icon.png", fit: BoxFit.fill,),
            ),
            Container(
                height: MediaQuery.of(context).size.height*0.13,
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Text("Karamana Upasabha is one of the grass-root level unit's of the Kerala Brahmana Sabha, a registered charitable organization which works for the progress of Kerala Iyers, one of the sects of Tamil Brahmins settled in Kerala.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  textAlign: TextAlign.justify,
                )
            ),
            SizedBox(height: 10.0,),
            Container(
              height: MediaQuery.of(context).size.height*0.05,
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Text("Executive Committee",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.5, decoration: TextDecoration.underline),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 250.0,
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    leading: Container(width: 70.0, height: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/appimages/president.jpeg"),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Krishna Moorthy.H",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text("President",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,),
                        Text("9846098989",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,)
                      ],
                    ),
                  ),
                  Divider(
                    height: 0.0,
                    color: Colors.black54,
                    endIndent: 10.0,
                    indent: 100.0,
                  ),
                  ListTile(
                    leading: Container(width: 70.0, height: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/appimages/secretary.jpeg"),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Mahesh.S",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,),
                        Text("Secretary",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,),
                        Text("9895961431",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,)
                      ],
                    ),
                  ),
                  Divider(
                    height: 0.0,
                    color: Colors.black54,
                    endIndent: 10.0,
                    indent: 100.0,
                  ),
                  ListTile(
                    leading: Container(width: 70.0, height: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/appimages/vsec.jpg"),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Rajambal.S",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,),
                        Text("Secretary Vanitha Vibhagom",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,),
                        Text("9446573376",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
