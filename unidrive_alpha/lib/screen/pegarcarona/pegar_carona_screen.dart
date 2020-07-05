import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unidrive_alpha/screen/pegarcarona/detalhes_carona.dart';
import 'package:unidrive_alpha/widgets/pegarcarona/InfoCard.dart';

class PegarCaronaScreen extends StatefulWidget {
  @override
  _PegarCaronaScreenState createState() => _PegarCaronaScreenState();
}

class _PegarCaronaScreenState extends State<PegarCaronaScreen> {
  Future getCaronas() async {
    QuerySnapshot query =
        await Firestore.instance.collection("caronas").where("ativo",isEqualTo: true).getDocuments();

    return query.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          padding: EdgeInsets.only(top: 10, left: 16),
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 34,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          "Pegar Carona",
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 30),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Container(
          child: FutureBuilder(
            future: getCaronas(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.all(25),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            child: InfoCard(
                              user: snapshot.data[index].data["username"],
                              localSaida: snapshot.data[index].data["localSaida"],
                              destino: snapshot.data[index].data["destino"],
                              horarioSaida: snapshot.data[index].data["horarioSaida"],
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetalhesCarona(
                                    name: snapshot.data[index].data["username"],
                                    localSaida: snapshot.data[index].data["localSaida"],
                                    destino: snapshot.data[index].data["destino"],
                                    horario: snapshot.data[index].data["horarioSaida"],
                                    valor: snapshot.data[index].data["valor"],
                                    telefone: snapshot.data[index].data["telefone"],
                                  ),
                                ), //envia ID da carona clicada
                              );
                            }),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}