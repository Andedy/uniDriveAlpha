import 'package:flutter/material.dart';
import 'package:unidrive_alpha/screen/darcarona/criar_carona.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';


class DetalhesCaronaWidget extends StatelessWidget {
  String name;
  String destino;
  String horario;
  String localSaida;
  String valor;
  String telefone;

  DetalhesCaronaWidget(
      {this.name, this.destino, this.horario, this.localSaida, this.valor, this.telefone}
  );

  String mensagem = "[UNIDRIVE] Quero saber mais sobre a carona!" ;

  void launchWhatsApp(
      {@required String telefone,
      @required String mensagem,
      }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/55$telefone/?text=${Uri.parse(mensagem)}";
      } else {
        return "whatsapp://send?phone=55$telefone&text=${Uri.parse(mensagem)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Carona de ",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Montserrat',
                  fontSize: 36,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 100),
        Container(
          height: 700, //era500
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
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
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            destino,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
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
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            localSaida,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
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
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            horario,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "h",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
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
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            "R\$ ",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            valor,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
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
                        OutlineButton(
                          padding: EdgeInsets.all(16), //conferir botoes e tamanhos
                          onPressed: () {
                            launchWhatsApp(telefone: telefone, mensagem: mensagem);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 300,
                            child: Text(
                              "Falar com motorista",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 7),
                        Container(
                          height: 40,
                          width: 340,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: FlatButton(
                            child: Text(
                              "Quer criar uma carona?",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CriarCarona()));
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
}
