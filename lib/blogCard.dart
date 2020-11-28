import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class blogCard extends StatelessWidget {

  String des = "";
  String title = "";
  String imgURl = "";

  blogCard(String description, String title, String url) {
    this.des = description;
    this.title = title;
    this.imgURl = url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 210,
      child: Card(
        child: InkWell(
          splashColor: Colors.blueAccent.withAlpha(75),
          onTap: () => bottomSheet(context, this.title, this.des, this.imgURl),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(imgURl, height: 150, fit: BoxFit.fill),
                //Image(image: CachedNetworkImageProvider(imgURl), height: 150, fit: BoxFit.fill),
                Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                            this.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,)
                        ),
                      ),
                    )
                )
              ]
          ),
        ),
      ),
    );
  }

  void bottomSheet(context, String title, String description, String img) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext bc) {
          return Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.30,
                child: Wrap(
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: MediaQuery.of(context).size.width,
                    ),
                    ListTile(
                      title: Text(title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),),
                    ),
                    Divider(
                      height: 0.0,
                      color: Colors.black54,
                      endIndent: 10.0,
                      indent: 10.0,
                    ),
                    ListTile(
                      title: Text(description, textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,),),
                    ),
                  ],
                ),
              ),

              Positioned(
                  right: MediaQuery.of(context).size.width*0.50 - 50.0,
                  bottom: MediaQuery.of(context).size.height*0.25,
                  child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            //image: CachedNetworkImageProvider(img),
                            image: NetworkImage(img),
                            fit: BoxFit.fill
                          )
                      ),
                  )
              )
            ],
          );
        }
    );
  }
}