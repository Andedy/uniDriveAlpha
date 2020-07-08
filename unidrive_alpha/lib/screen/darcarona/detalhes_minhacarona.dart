import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unidrive_alpha/widgets/custom_drawer.dart';
import 'package:unidrive_alpha/widgets/darcarona/detalhes_minhacarona.dart';
import 'package:unidrive_alpha/widgets/pegarcarona/detalhes_carona.dart';

class DetalhesMinhaCarona extends StatelessWidget {
 
  // String destino = "Torres";
  // String horario = "12";
  // String localSaida = "Capão";
  // String valor = "30";
  String destino;
  String horario;
  String localSaida;
  String valor;
  
  final _pageController = PageController();
  DetalhesMinhaCarona({this.destino,this.horario,this.localSaida,this.valor});

  @required
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: new IconButton(
          padding: EdgeInsets.only(top: 10, left: 16),
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 34,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  DetalhesMinhaCaronaWidget(destino: destino,horario: horario,localSaida: localSaida,valor: valor),
                  Positioned(
                    top: 120,
                    child: Container(
                      height: 120,
                      width: 370,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

