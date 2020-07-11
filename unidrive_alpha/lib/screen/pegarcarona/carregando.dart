import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'package:unidrive_alpha/screen/auth/login.dart';
import 'package:unidrive_alpha/screen/home.dart';
import 'package:unidrive_alpha/screen/pegarcarona/pegar_carona_screen.dart';

class CarregandoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<CarregandoScreen> {

  FirebaseUser firebaseUser;

  Future getCaronas() async {
    QuerySnapshot query = await Firestore.instance
        .collection("caronas")
        .where("ativo", isEqualTo: true)
        .getDocuments();
    return query.documents;
  }

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(milliseconds: 2700);
    return new Timer(duration, route);
  }

  route() async {
    if (firebaseUser == null) { //isso nao faz sentido, mas funciona (?) hm
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PegarCaronaScreen()));
    } 
    // else if ()

  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                // child: Image.asset("images/logo.png"),
                ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Column(
              children: [
                Text(
                  "Carregando Caronas",
                  style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 34, 16, 16),
                  child: Center(
                    child: Text(
                      "Ei! Convide seus amigos para o uniDrive :-)",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 64),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
