import 'package:flutter/material.dart';
import 'package:heroes/HeroDetail.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 void _exibirDetalhes(String hero, String image)
{
  print("Herói:" +hero);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HeroDetail(hero,image)));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Heroes"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(child: 
         Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: (){_exibirDetalhes("Daredevil","daredevil");},
                    child: Image.asset("images/daredevil.jpg", height: 170),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                     onTap: (){_exibirDetalhes("Captain America","america");},
                    child: Image.asset("images/america.jpg", height: 170),
                  ),
                ),
              ],
            ),
                        Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                     onTap: (){_exibirDetalhes("Hulk","hulk");},
                    child: Image.asset("images/hulk.jpg", height: 170),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                     onTap: (){_exibirDetalhes("Iron Man","iron");},
                    child: Image.asset("images/iron.jpg", height: 170),
                  ),
                ),
              ],
            ),
                        Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                     onTap: (){_exibirDetalhes("Black Panther","panther");},
                    child: Image.asset("images/panther.jpg", height: 170),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                     onTap: (){_exibirDetalhes("Spider-Man","spider");},
                    child: Image.asset("images/spider.jpg", height: 170),
                  ),
                ),
              ],
            ),
                        Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                     onTap: (){_exibirDetalhes("Thor","thor");},
                    child: Image.asset("images/thor.jpg", height: 170),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: GestureDetector(
                     onTap: (){_exibirDetalhes("Wolverine","wolverine");},
                    child: Image.asset("images/wolverine.jpg", height: 170),
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}
