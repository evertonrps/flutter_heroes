import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'configuracao/Helper.dart';

class HeroDetail extends StatefulWidget {
  String heroName;
  String heroImage;

  HeroDetail(this.heroName, this.heroImage, {Key key}) : super(key: key);

  @override
  _HeroDetailState createState() => _HeroDetailState();
}

class _HeroDetailState extends State<HeroDetail> {
  var _helper = Helper();

  Future<Map> _recuperarHeroes() async {
    var currentPhoneDate = new DateTime.now();

// the number of .net ticks at the unix epoch
    var epochTicks = 621355968000000000;

// there are 10000 .net ticks per millisecond
    var ticksPerMillisecond = 10000;

// calculate the total number of .net ticks for your date
    var netTicks = epochTicks +
        (currentPhoneDate.millisecondsSinceEpoch * ticksPerMillisecond);

    print(netTicks.toString());

    String hash = _helper.gerarHash(
        netTicks.toString(), _helper.publicKey, _helper.privateKey);

    String url =
        "${_helper.baseURL}characters?ts=${netTicks.toString()}&apikey=${_helper.publicKey}&hash=${hash.toString()}&name=${widget.heroName}";

    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _recuperarHeroes(),
      builder: (context, snapshot) {
        String resultado;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            print("conexão waiting");
            resultado = "Loading...";
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            print("conexão done");
            if (snapshot.hasError) {
              resultado = "Erro ao carregar os dados :(";
            } else {
              var ret = snapshot.data["data"]["results"][0]["description"];
              resultado = ret.toString();
            }
            break;
        }
        //teste // 44
        return Scaffold(
          appBar: AppBar(
            title: Text("Hero Page"),
            backgroundColor: Colors.red,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "images/${widget.heroImage}.jpg",
                        height: 100,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "About ${widget.heroName}",
                          style:
                              TextStyle(fontSize: 20, color: Colors.deepOrange),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(resultado),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
