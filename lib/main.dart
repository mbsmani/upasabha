import 'package:flutter/material.dart';
import 'newsPage.dart';
import 'peoplePage.dart';
import 'aboutPage.dart';

void main() {
  runApp(appMain());;
}

class appMain extends StatefulWidget {
  @override
  _appMainState createState() => _appMainState();
}

class _appMainState extends State<appMain> {

  int selectedPage = 0;
  final pageOptions = [newsPage(), peoplePage(), aboutPage() ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: selectedPage,
          onTap: (int index){
            setState(() {
              selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.description), title: Text("News")),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("People")),
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("About"))
          ],
        ),
      ),
    );
  }
}
