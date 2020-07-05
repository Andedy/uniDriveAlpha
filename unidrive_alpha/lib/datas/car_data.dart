import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  String idCar; //
  String nome;
  String placa;
  String passageirosAceitos;
  String cor;

  Car();

  Car.fromDocument(DocumentSnapshot document) {
    idCar = document.documentID;
    nome = document.data["nome"];
    placa = document.data["placa"];
    passageirosAceitos = document.data["passageirosAceitos"];
    cor = document.data["cor"];
  }

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "placa": placa,
      "passageirosAceitos": passageirosAceitos,
      "cor": cor,
      "idCar": idCar
    };
  }
}
