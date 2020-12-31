import 'package:flutter/material.dart';
import 'package:anil/model.dart';
import 'package:anil/DetailedPage.dart';

class CardPage extends StatelessWidget {
  List eachItems = new List();
  Model model;
  List movieDetails;
  CardPage(this.model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Movie List"),backgroundColor:Colors.green.shade700),
      body: ListView(
        children: EachCard(context),
      ),
    );
  }

  List<Widget> EachCard(BuildContext context) {
    List<Widget> _cards = List();
    for (int i = 0; i < model.title.length; i++) {
      Widget _eachCard = GestureDetector(onTap:(){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailedPage(model,i),));
        print("its ok");
      },child:Card(
        color: Colors.white60,
        child: Column(children: [
          Container(alignment:Alignment.centerLeft,
            child: Text(
             "Movie: ${model.title[i]}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
          ),
          Container(alignment:Alignment.centerLeft,
            padding:EdgeInsets.only(top:5.0,bottom:5.0,left:5.0),
            child: Text("Year :${model.year[i]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),

          Image(
            height: 300,
            width: double.infinity,
            fit: BoxFit.fill,
            image: NetworkImage("${model.image_url[i]}"),
          ),

        ]),
      ));
      _cards.add(_eachCard);
    }
    return _cards;
  }
}
