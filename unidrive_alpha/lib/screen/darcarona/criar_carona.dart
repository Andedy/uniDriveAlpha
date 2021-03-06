import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/datas/carona_data.dart';
import 'package:unidrive_alpha/models/carona_model.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'package:unidrive_alpha/screen/darcarona/detalhes_minhacarona.dart';
import 'package:unidrive_alpha/screen/home.dart';
import 'dart:async';

import 'package:unidrive_alpha/widgets/darcarona/detalhes_minhacarona.dart';

class CriarCarona extends StatefulWidget {
  String username;
  final Carona carona;

  CriarCarona({this.username, this.carona});

  @override
  _CriarCaronaState createState() => _CriarCaronaState();
}

class _CriarCaronaState extends State<CriarCarona> {
  final _destinoController = TextEditingController();
  final _localSaidaController = TextEditingController();
  final _horarioSaidaController = TextEditingController();
  final _valorController = TextEditingController();
  final _telController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Color(0xFF08AEA4)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ScopedModelDescendant<CaronaModel>(
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
                    Container(
                        alignment: Alignment.center,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Criar",
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              " Carona",
                              style: TextStyle(
                                fontSize: 42,
                                fontFamily: 'Montserrat',
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 64),
                Text(
                  "Vai pra onde?",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
                TextFormField(
                  controller: _destinoController,
                  decoration: InputDecoration(
                    hintText: "Informe faculdade de destino",
                    hintStyle: TextStyle(
                        //fontWeight: FontWeight.bold
                        ),
                  ),
                  validator: (text) {
                    if (text.isEmpty) return "Faculdade Inválida!";
                  },
                ),

                SizedBox(height: 16.0),

                Text(
                  "Local de saída?",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
                TextFormField(
                  controller: _localSaidaController,
                  decoration: InputDecoration(
                    hintText: "Insira seu Endereço",
                    hintStyle: TextStyle(
                        //fontWeight: FontWeight.bold
                        ),
                  ),
                  validator: (text) {
                    if (text.isEmpty) return "Endereço inválido!";
                  },
                ),

                SizedBox(height: 16.0),

                Text(
                  "Qual horário de saída?",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
                // SizedBox(height: 16.0,),
                TextFormField(
                    controller: _horarioSaidaController,
                    decoration: InputDecoration(
                      hintText: "Informe horário de saída",
                      hintStyle: TextStyle(
                          //fontWeight: FontWeight.bold
                          ),
                    ),
                    // keyboardType: TextInputType.numberWithOptions(),
                    onTap: () {},
                    validator: (text) {
                      if (text.isEmpty) return "Horário de saída inválido!";
                    }),

                SizedBox(
                  height: 16.0,
                ),

                Text(
                  "Valor da carona?",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
                TextFormField(
                    controller: _valorController,
                    decoration: InputDecoration(
                      hintText: "R\$",
                      hintStyle: TextStyle(
                          //fontWeight: FontWeight.bold
                          ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    validator: (text) {
                      if (text.isEmpty)
                        return "Se o valor for R\$0 ou a combinar, informe o número 0. :-)";
                    }),

                SizedBox(height: 16),
                Text(
                  "Whatsapp",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
                TextFormField(
                    controller: _telController,
                    decoration: InputDecoration(
                      hintText: "Exemplo: 51999999999",
                      semanticCounterText:
                          'Insira seu telefone. Exemplo: 51999999999',
                      hintStyle: TextStyle(

                          //fontWeight: FontWeight.bold
                          ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (text) {
                      if (text.isEmpty) return "Whatsapp Inválido!";
                    }),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Text(
                          "Ao criar uma carona, pessoas poderão ",
                          semanticsLabel: 'entrar em contato pelo seu Whatsapp',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          "entrar em contato pelo seu Whatsapp.",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                    padding: EdgeInsets
                        .zero, //faz meu botão ficar bem colado a direita (máximo do scaffold)
                  ),
                ),
                SizedBox(height: 24),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                  child: Text(
                    "Enviar Carona",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(12.0),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Carona caronas = new Carona();
                      caronas.destino = _destinoController.text;
                      caronas.localSaida = _localSaidaController.text;
                      caronas.horarioSaida = _horarioSaidaController.text;
                      caronas.valor = _valorController.text;
                      caronas.username = widget.username;
                      caronas.telefone = _telController.text;
                      //model.addCarona(caronas, _onSuccess, _onFail);
                      model.criaCarona(caronas);
                      // model.addCarona(caronas, () { }, () { });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetalhesMinhaCarona(
                              // username: widget.username,
//descomment aqui

                              localSaida: _localSaidaController.text,
                              destino: _destinoController.text,
                              horario: _horarioSaidaController.text,
                              valor: _valorController.text,
//ate aqui
                              ),
                        ), //envia ID da carona para DetalhesCarona()
                      );

                      // Map<String, dynamic> caronaData = {
                      //     "destino": _destinoController.text,
                      //     "localSaida": _localSaidaController.text,
                      //     "horarioSaida": _horarioSaidaController.text,
                      //   };

                      //   model.addCarona(
                      //     caronaData: caronaData,
                      //     onSuccess: _onSuccess,
                      //     onFail: _onFail,
                      //   );
                    }
                  },
                ),
                Align(
                  alignment: Alignment.center,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Quer procurar uma carona?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Montserrat'),
                    ),
                    padding: EdgeInsets
                        .zero, //faz meu botão ficar bem colado a direita (máximo do scaffold)
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Carona criada com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar carona."),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
