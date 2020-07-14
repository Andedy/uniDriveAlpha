import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'package:unidrive_alpha/screen/auth/historico.dart';
import 'package:unidrive_alpha/screen/darcarona/detalhes_minhacarona.dart';
import 'package:unidrive_alpha/screen/pegarcarona/detalhes_carona.dart';
import 'package:unidrive_alpha/widgets/pegarcarona/InfoCard.dart';

class MinhasCaronasList extends StatefulWidget {
 
  final _pageController = PageController();

  @override
  _PegarCaronaScreenState createState() => _PegarCaronaScreenState();
}

class _PegarCaronaScreenState extends State<MinhasCaronasList> {

  Future getCaronas() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    // print(user);
    QuerySnapshot query = await Firestore.instance
        .collection("caronas")
        .where("userId", isEqualTo: user.uid)
        .getDocuments();
    return query.documents;
  }

  

  @override
  Widget build(BuildContext context) {
    // print(user.uid);

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          padding: EdgeInsets.only(top: 10, left: 16),
          icon: new Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
            size: 34,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            "Suas Caronas",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          color: Colors.white,
          child: Container(
            child: FutureBuilder(
              future: getCaronas(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 1),
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
                              localSaida:
                                  snapshot.data[index].data["localSaida"],
                              destino: snapshot.data[index].data["destino"],
                              horarioSaida:
                                  snapshot.data[index].data["horarioSaida"],
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetalhesMinhaCarona(
                                    name: snapshot.data[index].data["username"],
                                  localSaida:
                                      snapshot.data[index].data["localSaida"],
                                  destino: snapshot.data[index].data["destino"],
                                  horario:
                                      snapshot.data[index].data["horarioSaida"],
                                  valor: snapshot.data[index].data["valor"],
                                  telefone:
                                      snapshot.data[index].data["telefone"],
                                  ativo:
                                      snapshot.data[index].data["ativo"],
                                  ),
                                ), //envia ID da carona para DetalhesCarona()
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
