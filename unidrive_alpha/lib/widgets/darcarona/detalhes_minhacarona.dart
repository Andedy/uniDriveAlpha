import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unidrive_alpha/datas/carona_data.dart';
import 'package:unidrive_alpha/screen/darcarona/criar_carona.dart';

class DetalhesMinhaCaronaWidget extends StatelessWidget {
  String destino;
  String horario;
  String localSaida;
  String valor;
  bool ativo;

  getDocId() async{
  QuerySnapshot snapshot = await Firestore.instance.collection('caronas').getDocuments();
  snapshot.documents.forEach((myDoc){
    // return myDoc.documentID;
    print(myDoc.documentID);
  });
  } 

  atualizaCarona() async{
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  QuerySnapshot snapshot = await Firestore.instance
  .collection('caronas')
  .where("userId", isEqualTo: user.uid)
  .getDocuments();
  snapshot.documents.forEach((myDoc){
    myDoc.reference.updateData({'ativo': false});
    print(myDoc.documentID);
  });
  } 

// final docId = 

  deleteData(docId) {
    Firestore.instance
        .collection('caronas')
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  List<Carona> caronas = [];

  DetalhesMinhaCaronaWidget(
      {this.destino, this.horario, this.localSaida, this.valor, this.ativo});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
          // padding: EdgeInsets.only(top: 40),
          padding: EdgeInsets.fromLTRB(0, 40, 0, 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Text(
                    "Você criou ",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    "essa carona",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // SizedBox(height: 80),
        Container(
          height: 700, //era500
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 64),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Destino: ",
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            destino,
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Saída: ",
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            localSaida,
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Horário: ",
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            horario,
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "h",
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Valor: ",
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            "R\$ ",
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            valor,
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 150),
                    Column(
                      children: <Widget>[
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            //side: BorderSide(color: Colors.red),
                          ),
                          child: Text(
                            "Pausar Carona",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                          color: Color(0xFF292929),
                          onPressed: () {
                            atualizaCarona();
                          },
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 40,
                          width: 340,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: FlatButton(
                            child: Text(
                              "Excluir Carona",
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              // deleteCarona;
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => CriarCarona()));
                              getDocId();
                            },
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // void deleteCarona(user.uid) {
  //   Firestore.instance.collection("caronas").document(carona.idCarona).delete();

  //   caronas.remove(carona);
  // }

  // void updateCarona(Carona carona){
  //    Firestore.instance
  //       .collection("caronas")
  //       .document(carona.idCarona)
  //       .delete();

  //   caronas.remove(carona);
  // }
}
