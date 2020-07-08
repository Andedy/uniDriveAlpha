import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unidrive_alpha/widgets/custom_drawer.dart';
import 'package:unidrive_alpha/widgets/pegarcarona/detalhes_carona.dart';

class DetalhesCarona extends StatelessWidget {
  Future getCaronas() async {
    QuerySnapshot query =
        await Firestore.instance.collection("caronas").getDocuments();

    return query.documents;
  }

  String name;
  String destino;
  String horario;
  String localSaida;
  String valor;
  String telefone; 
  
  final _pageController = PageController();
  DetalhesCarona({this.name,this.destino,this.horario,this.localSaida,this.valor, this.telefone});

  @required
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          // FlatButton(
          //   child: Icon(
          //     Icons.more_horiz,
          //     color: Theme.of(context).primaryColor,
          //     size: 50,
          //   ),
          //   onPressed: () {
          //   },
          // ),
        ],
        leading: new IconButton(
          padding: EdgeInsets.only(top: 10, left: 16),
          icon: new Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
            size: 34,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      drawer: CustomDrawer(_pageController),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  DetalhesCaronaWidget(name: name,destino: destino,horario: horario,localSaida: localSaida,valor: valor, telefone: telefone),
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

