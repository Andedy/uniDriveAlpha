import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'package:unidrive_alpha/screen/auth/login.dart';
import 'package:unidrive_alpha/screen/pegarcarona/pegar_carona_screen.dart';
import 'package:unidrive_alpha/widgets/custom_drawer.dart';
import 'package:unidrive_alpha/widgets/home.option.dart';

import 'darcarona/criar_carona.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color back = Colors.white;
  Color showTop = Color(0xFF08AEA4);
  Color showBottom = Color(0xFFFFFFFF);
  double fontsize = 36;
  bool topButtonDisabled = false;
  bool bottomButtonDisabled = false;
  final _pageController = PageController();

  BorderRadiusGeometry _topContainerBorderRadius = BorderRadius.only(
    bottomLeft: const Radius.circular(40),
    bottomRight: const Radius.circular(40),
  );

  Future darCarona(String username) async {
    await Future.delayed(Duration(seconds: 1));
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CriarCarona(), //mudar para CARONASCREEN
      ),
    );
  }

  Future pegarCarona() async {
    await Future.delayed(Duration(seconds: 1));
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PegarCaronaScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser() == null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      return Scaffold(
      backgroundColor: back,
      appBar: AppBar(
        leading: new IconButton(
          padding: EdgeInsets.only(top: 10, left: 16),
          icon: new Icon(
            Icons.menu,
            color: back,
            size: 34,
          ),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => CustomDrawer(_pageController))),
        ),
        elevation: 0,
        backgroundColor: showTop,
      ),
      drawer: CustomDrawer(_pageController),
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading) return Center(child: CircularProgressIndicator());

        return Container(
          color: showBottom,
          child: Column(
            children: <Widget>[
              HomeOption(
                ContainerBorderRadius: _topContainerBorderRadius,
                ContainerHeight: 550,
                func: pegarCarona,
                title1: "Pegar",
                title2: "Carona",
                backColor: showTop,
                fontColor: Color(0xFFFFFFFF),
                isButtonDisabled: topButtonDisabled,
              ),
              Expanded(
                child: HomeOption(
                  ContainerHeight: 0,
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CriarCarona(username: model.userData["name"]), //mudar para CARONASCREEN
                      ),
                    );
                  },
                  title1: "Dar",
                  title2: "Carona",
                  backColor: Colors.white,
                  fontColor: Theme.of(context).primaryColor,
                  isButtonDisabled: bottomButtonDisabled,
                ),
              ),
            ],
          ),
        );

      }),
    );
    }


    
  }
}