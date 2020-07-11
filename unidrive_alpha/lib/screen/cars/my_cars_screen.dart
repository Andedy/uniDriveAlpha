import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/datas/car_data.dart';
import 'package:unidrive_alpha/models/car_model.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'package:unidrive_alpha/screen/auth/login.dart';
import 'package:unidrive_alpha/screen/cars/create_car_screen.dart';
import 'package:unidrive_alpha/screen/cars/delete_car_screen.dart';
import 'package:unidrive_alpha/widgets/cars/infoCard_Car.dart';

class MyCarsScreen extends StatelessWidget {
  // final nome = FirebaseAuth.instance.currentUser().

  // final Car car;
  // MyCarsScreen(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          padding: EdgeInsets.only(top: 16, left: 16),
          icon: new Icon(
            Icons.arrow_back,
            color: Color(0xFF08AEA4),
            size: 34,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF292929),
      body: ScopedModelDescendant<CarModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            return Center(
              child: CircularProgressIndicator(strokeWidth: 1),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            return Container(
              padding: EdgeInsets.all(34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.clear,
                    size: 64,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Faça o Login para prosseguir!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            //side: BorderSide(color: Colors.red),
                          ),
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          },
                        ),
                ],
              ),
            );
          } else if (model.cars == null || model.cars.length == 0) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Nenhum veículo adicionado!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  RaisedButton(
                    child: Text(
                      "Adicionar",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CreateCar()));
                    },
                  ),
                ],
              ),
            );
          } else {
            return Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 24),
                    color: Color(0xFF292929),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Meus",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Veículos",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(25),
                      children: <Widget>[
                        Column(
                          children: model.cars.map((thisCar) {
                            return InfoCardCar(thisCar);
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateCar()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Adicionar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                " novo veículo",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            //side: BorderSide(color: Colors.red),
                          ),
                          child: Text(
                            "Selecionar",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyCarsScreen()));
                          },
                        ),
                        SizedBox(height: 10),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DeleteCarScreen()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Excluir veículo",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontFamily: 'Montserrat',
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(6),
                  //   // decoration: BorderRadius.all(40),
                  //   color: Colors.transparent,
                  //   child: FlatButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: Text(
                  //       "Precisa de ajuda?",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(color: Colors.white30),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
