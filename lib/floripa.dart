import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Floripa extends StatefulWidget {
  @override
  _FloripaState createState() => _FloripaState();
}

class _FloripaState extends State<Floripa> {
  Future<Map> _getData() async {
    http.Response response =
        await http.get("https://api.hgbrasil.com/weather?woeid=455861");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Carregando Dados",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ]);
          default:
            if (snapshot.hasError) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ERROR",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ]);
            }
            return ColunaPadrao(snapshot.data);
        }
      },
    );
  }

  Widget ColunaPadrao(Map data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: Icon(
            Icons.cloud,
            color: Colors.white,
            size: 150,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  data["results"]["city"],
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  data["results"]["description"],
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Temperatura",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    data["results"]["temp"].toString() + "º",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 25)),
              Column(
                children: [
                  Text(
                    "Humidade",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    data["results"]["humidity"].toString() + "%",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Vel. do Vento",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    data["results"]["wind_speedy"].toString(),
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 25)),
              Column(
                children: [
                  Text(
                    "Condição",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    data["results"]["condition_slug"].toString(),
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Nascer do Sol",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    data["results"]["sunrise"].toString(),
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 25)),
              Column(
                children: [
                  Text(
                    "Pôr do Sol",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    data["results"]["sunset"].toString(),
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
