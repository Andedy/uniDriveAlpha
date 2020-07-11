import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'package:unidrive_alpha/screen/auth/login.dart';
import 'package:unidrive_alpha/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);



  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
            color: Color(0xFF292929),
          ),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          // SizedBox(height: 10.0,),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 64.0, right: 32.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Column(
                        children: [
                          Text(
                            "uniDrive",
                            style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Theme.of(context).primaryColor,
                              //color: Colors.white,
                            ),
                          ),
                          // Text(
                          //   "seu App de caronas",
                          //    style: TextStyle(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //     fontFamily: 'Montserrat',
                          //     color: Theme.of(context).primaryColor,
                          //     //color: Colors.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                child: Text(
                                  !model.isLoggedIn()
                                      ? "Entre ou cadastre-se >"
                                      : "Sair",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  if (!model.isLoggedIn())
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  else
                                    model.signOut();
                                },
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(),
              SizedBox(
                height: 10.0,
              ),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Termos de Uso", pageController, 1),
              DrawerTile(Icons.location_on, "Locais", pageController, 2),
              DrawerTile(Icons.playlist_add_check, "Concluído", pageController, 3),
              DrawerTile(Icons.directions_car, "Meus veículos", pageController, 4),
              SizedBox(
                height: 10.0,
              ),
              Divider(),
            ],
          )
        ],
      ),
    );
  }
}
