import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/datas/car_data.dart';
import 'package:unidrive_alpha/models/car_model.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'dart:async';

import 'package:unidrive_alpha/screen/Cars/my_cars_screen.dart';

class CreateCar extends StatefulWidget {
  @override
  _CreateCarState createState() => _CreateCarState();
}

class _CreateCarState extends State<CreateCar> {
  final _nameController = TextEditingController();
  final _placaController = TextEditingController();
  final _passageirosController = TextEditingController();
  final _corController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292929),
      key: _scaffoldKey,
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
      body: ScopedModelDescendant<CarModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(child: CircularProgressIndicator(strokeWidth: 1));

          return Form(
            key: _formKey, //faz meu validator funcionar
            child: ListView(
              padding: EdgeInsets.all(36.0),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ClipPath(
                      child: Container(
                        // decoration: InputDecoration(
                        //   enabledBorder: UnderlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.red)
                        //   ),
                        // ),
                        alignment: Alignment.center,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Adicionar",
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              " Veículo",
                              style: TextStyle(
                                fontSize: 42,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 64),
                Text(
                  "Nome do veículo",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Montserrat',
                    // fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    hintText: "Marca e Nome de veículo",
                    hintStyle: TextStyle(
                      color: Colors.white24,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  validator: (text) {
                    if (text.isEmpty) return "Nome Inválido!";
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  "Placa",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Montserrat',
                    // fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                TextFormField(
                  controller: _placaController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    hintText: "Placa do seu Veículo",
                    hintStyle: TextStyle(
                      //fontWeight: FontWeight.bold
                      color: Colors.white24,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  validator: (text) {
                    if (text.isEmpty) return "Placa inválida!";
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  "Passageiros Aceitos",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Montserrat',
                    // fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                TextFormField(
                    controller: _passageirosController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70)),
                      hintText: "Quantidade máxima de passageiros aceitos",
                      hintStyle: TextStyle(
                        //fontWeight: FontWeight.bold
                        color: Colors.white24,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    onTap: () {},
                    validator: (text) {
                      if (text.isEmpty || text.length < 1)
                        return "Adicione um número de passageiros válido!";
                    }),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Cor",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Montserrat',
                    // fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                TextFormField(
                    controller: _corController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70)),
                      hintText: "Cor do seu veículo",
                      hintStyle: TextStyle(
                        //fontWeight: FontWeight.bold
                        color: Colors.white24,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return "Cor inválida!";
                    }),
                SizedBox(height: 120),
                Container(
                  padding: EdgeInsets.only(bottom: 54),
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          //side: BorderSide(color: Colors.red),
                        ),
                        child: Text(
                          "Salvar",
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(130, 10, 130, 10),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyCarsScreen()));
                          if(_formKey.currentState.validate()){
                          Car cars= new Car();
                           cars.nome = _nameController.text;
                           cars.placa = _placaController.text;
                           cars.passageirosAceitos = _passageirosController.text;
                           cars.cor = _corController.text;
                           model.addCar(cars);

                            /*  Map<String, dynamic> car = {
                               "nome": _nameController.text,
                              "placa": _placaController.text,
                               "passageirosAceitos": _passageirosController.text,
                               "cor": _corController.text,
                               "idCar": "teste",
                             };
                            */
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cancelar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
