import 'package:cloud_firestore/cloud_firestore.dart';

class Carona{
  String idCarona; //
  String destino;
  String localSaida;
  String horarioSaida;
  String valor;
  String username;
  bool ativo;
  String telefone;

  Carona();

  Carona.fromDocument(DocumentSnapshot document) {
    idCarona = document.documentID;
    destino = document.data["caronaInfo"];
    localSaida = document.data["localSaida"];
    horarioSaida = document.data["horarioSaida"];
    valor = document.data["valor"];
    username = document.data["username"];
    ativo = document.data["ativo"];
    telefone = document.data["telefone"];
  }

  Map<String, dynamic> toMap() {
    return {
      "idCarona": idCarona,
      "destino": destino,
      "localSaida": localSaida,
      "horarioSaida": horarioSaida,
      "valor": valor,
      "username": username,
      "ativo": ativo,
    };
  }
}