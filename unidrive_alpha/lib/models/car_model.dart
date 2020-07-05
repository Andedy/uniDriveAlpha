import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/datas/car_data.dart';
import 'package:unidrive_alpha/models/user_model.dart';

class CarModel extends Model {
  UserModel user;

  List<Car> cars = [];

  bool isLoading = false;
  CarModel(this.user) {
    if (user.isLoggedIn()) _loadCars();
  }

  static CarModel of(BuildContext context) => ScopedModel.of<CarModel>(context);
  //deixa acessar o CarModel em todo o app

  void addCar(Car car) {
    // void addCar({@required Map<String, dynamic> car}) {
    cars.add(car);

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cars")
        .add(car.toMap())
        .then((doc) {
      car.idCar = doc.documentID;
    });
    notifyListeners();
  }

  void removeCar(Car car) {
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cars")
        .document(car.idCar)
        .delete();

    cars.remove(car);
    notifyListeners();
  }

  void _loadCars() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cars")
        .getDocuments();

    cars = query.documents.map((doc) => Car.fromDocument(doc)).toList();
    notifyListeners();
  }


}
