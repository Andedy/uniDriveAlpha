import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unidrive_alpha/screen/auth/historico.dart';
import 'package:unidrive_alpha/widgets/custom_drawer.dart';
import 'package:unidrive_alpha/widgets/darcarona/detalhes_minhacarona.dart';
import 'package:unidrive_alpha/widgets/pegarcarona/detalhes_carona.dart';

class DetalhesMinhaCarona extends StatelessWidget {
  // String destino = "Torres";
  // String horario = "12";
  String localSaida = "Capão";
  String valor = "30";

  String destino;
  String horario;
  // String localSaida;
  // String valor;

  // final String username;

  // DetalhesMinhaCarona(this.username);

  //  Future getCaronas() async {
  //   QuerySnapshot query = await Firestore.instance
  //       .collection("caronas")
  //       .where("ativo", isEqualTo: true)
  //       .getDocuments();
  //   return query.documents;
  // }

  //username = widget.username;

  final _pageController = PageController();
  // DetalhesMinhaCarona({this.destino,this.horario,this.localSaida,this.valor});

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
      drawer: CustomDrawer(_pageController),
      body: StreamBuilder(
          stream: Firestore.instance.collection('caronas')
          .where("userId", isEqualTo: user)
          .where("ativo", isEqualTo: true)
          .snapshots(),


          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 1),
              );
            }
            return SingleChildScrollView(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        DetalhesMinhaCaronaWidget(
                          //preciso pegar o "documentID que tenha o userid atual (ele é o criador da carona)"
                          //e preciso por no snapshot.data.documents[AQUI DENTRO] pra poder chamar o negocio que
                          destino: snapshot.data.documents[0]['destino'],
                          horario: snapshot.data.documents[0]['horarioSaida'],
                          localSaida: snapshot.data.documents[0]['localSaida'],
                          valor: snapshot.data.documents[0]['valor'],
                        ),
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
            );
          }),
    );
  }

  getDocument() async {
    String userId = (await FirebaseAuth.instance.currentUser()).uid;
    return Firestore.instance.collection('caronas').document(userId);
  }
}
