import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/datas/car_data.dart';
import 'package:unidrive_alpha/datas/carona_data.dart';
import 'package:unidrive_alpha/models/user_model.dart';

class CaronaModel extends Model {
  UserModel user;

  List<Carona> caronas = [];
  List<Car> cars = [];

  bool isLoading = false;

  CaronaModel(this.user) {
    if (user.isLoggedIn()) _loadCaronas();
  }

  static CaronaModel of(BuildContext context) =>
      ScopedModel.of<CaronaModel>(context);
  //esse scoped deixa acessar o CaronaModel em todo o app

  void addCarona(Carona caronaData, @required VoidCallback onSuccess,
      @required VoidCallback onFail) {
    caronas.add(caronaData);

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("historico")
        .add(caronaData.toMap())
        .then((doc) {
      caronaData.idCarona = doc.documentID;
    });
    notifyListeners();
  }


//criar um "select" no infoCard de pegarCarona e puxar ID pra apagar
  void removeCarona(Carona carona) {
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("caronas")
        .document(carona.idCarona)
        .delete();

    caronas.remove(carona);
    notifyListeners();
  }


  void _loadCaronas() async {
    QuerySnapshot query =
        await Firestore.instance.collection("caronas").getDocuments();

    caronas = query.documents.map((doc) => Carona.fromDocument(doc)).toList();
    notifyListeners();
  }


  


  
  Future<String> criaCarona(Carona carona) async { //testando Carona carona
    if (caronas.length == 0) return null;

    isLoading = true;
    notifyListeners();

    DocumentReference refCarona =
        await Firestore.instance.collection("caronas").add(
      {
        "userId": user.firebaseUser.uid,
        "username": carona.username,
        "destino": carona.destino,
        "horarioSaida": carona.horarioSaida,
        "localSaida": carona.localSaida,
        "valor" : carona.valor,
        "ativo": true,
        "telefone": carona.telefone,
        // "cars": cars.map((cars) => cars.toMap()).toList(),
      },
    );
    await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("caronas")
        .document(refCarona.documentID)
        .setData({"caronaId": refCarona.documentID});

    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("caronas")
        .getDocuments();

    for (DocumentSnapshot doc in query.documents) {
      doc.reference.delete();
    }

    caronas.clear();

    isLoading = false;
    notifyListeners();
    //apaga todo meu carrinho depois de fazer a compra... finalizando tudo

    return refCarona.documentID;
  }






  Future<String> arquivaCarona(Carona carona) async { //testando Carona carona
    if (caronas.length == 0) return null;

    isLoading = true;
    notifyListeners();

    DocumentReference refCarona =
        await Firestore.instance.collection("historico").add(
      {
        "userId": user.firebaseUser.uid,
        "username": carona.username,
        "destino": carona.destino,
        "horarioSaida": carona.horarioSaida,
        "localSaida": carona.localSaida,
        "valor" : carona.valor,
        "ativo": false,
        "telefone": carona.telefone,
        // "cars": cars.map((cars) => cars.toMap()).toList(),
      },
    );
    await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("historico")
        .document(refCarona.documentID)
        .setData({"caronaId": refCarona.documentID});

    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("historico")
        .getDocuments();

    for (DocumentSnapshot doc in query.documents) {
      doc.reference.delete();
    }

    caronas.clear();

    isLoading = false;
    notifyListeners();
    //apaga todo meu carrinho depois de fazer a compra... finalizando tudo

    return refCarona.documentID;
  }
} 