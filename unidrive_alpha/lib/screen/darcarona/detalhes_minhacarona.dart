import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'package:unidrive_alpha/screen/auth/historico.dart';
import 'package:unidrive_alpha/screen/home.dart';
import 'package:unidrive_alpha/widgets/custom_drawer.dart';
import 'package:unidrive_alpha/widgets/darcarona/detalhes_minhacarona.dart';
import 'package:unidrive_alpha/widgets/pegarcarona/detalhes_carona.dart';

class DetalhesMinhaCarona extends StatelessWidget {
  final _pageController = PageController();

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
  bool ativo;

  DetalhesMinhaCarona(
      {this.name,
      this.destino,
      this.horario,
      this.localSaida,
      this.valor,
      this.telefone,
      this.ativo});

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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      drawer: CustomDrawer(_pageController),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  DetalhesMinhaCaronaWidget(
                      destino: destino,
                      horario: horario,
                      localSaida: localSaida,
                      valor: valor,
                      ativo: ativo),
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
