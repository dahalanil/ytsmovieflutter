import 'package:flutter/material.dart';
import 'package:anil/model.dart';

class DetailedPage extends StatelessWidget {
  Model model;
  int index;
  DetailedPage(this.model, this.index);
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie review"),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView(children: [
        _sizedBox(),
        _cover(),
        _sizedBox(),

        _sizedBox(),
        _discription(),
        _sizedBox(),
        _review(),
        _sizedBox(),
      ]),
    );
  }

  Widget _sizedBox() {
    return SizedBox(height: 10.0);
  }

  Widget _cover() {
    return Row(children: [
      Expanded(

        child: Image(
          fit: BoxFit.fill,
          height: 225.0,
          image: NetworkImage("${model.image_url[index]}"),
        ),
      ),

    ]);
  }



  Widget _discription() {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text("${model.summary[index]}", style: TextStyle(fontSize: 16.0)));
  }

  Widget _review() {
    return Center(
      child: Row(children: [
        SizedBox(width:10.0),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [

          Text("Rating:", style: TextStyle( fontSize: 20.0)),
          Text("Language:",
              style: TextStyle( fontSize: 20.0)),
          Text("MPA rating:",
              style: TextStyle( fontSize: 20.0)),
          Text("Run Time:",
              style: TextStyle( fontSize: 20.0)),
          Text("Quality:", style: TextStyle( fontSize: 20.0)),
          Text("Type:", style: TextStyle( fontSize: 20.0)),
        ]),
        SizedBox(width: 20.0),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Text("${model.Rating[index]}", style: TextStyle(fontSize: 20.0)),
          Text(model.Language[index], style: TextStyle(fontSize: 20.0)),
          Text("${model.Certificate[index]}", style: TextStyle(fontSize: 20.0)),
          Text("${model.time[index]} min", style: TextStyle(fontSize: 20.0)),
          Text("${model.Quality[index]}", style: TextStyle(fontSize: 20.0)),
          Text("Blue-Ray", style: TextStyle(fontSize: 20.0)),
        ])
      ]),
    );
  }

  List _rating() {
    List<Widget> star = new List();
    Widget eachstar,eachHalfStar;
    num rating=model.Rating[index];
    num doubleRating=rating*10;
    int intRating=doubleRating~/10;// double to int
    num halfStar=rating-intRating;


    for (int i = 0; i < intRating; i++) {
      eachstar = Icon(Icons.star, color: Colors.yellow.shade600);
      star.add(eachstar);
    }
    if(halfStar>0.4){
      eachHalfStar = Icon(Icons.star_half, color: Colors.yellow.shade600);
      star.add(eachHalfStar);
    }
    return star;
  }
  List _genre(){
    List<Widget> genre=new List();
    List fetchgenre=model.genre[index];//loading genre for invididual movie
    Widget eachGenre;
    int len=fetchgenre.length;
    for(int i=0;i<len;i++){
      eachGenre=Text(fetchgenre[i],style: TextStyle(fontSize: 20.0));

      genre.add(eachGenre);
      genre.add(Text(",",style: TextStyle(fontSize: 25.0)));
    }
    genre.removeLast();
    return genre;
  }
}
