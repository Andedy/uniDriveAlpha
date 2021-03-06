import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/screen/auth/login.dart';
import 'package:unidrive_alpha/screen/auth/termos.dart';
import 'package:unidrive_alpha/screen/darcarona/detalhes_minhacarona.dart';
import 'package:unidrive_alpha/screen/darcarona/minhas_caronas.dart';
import 'package:unidrive_alpha/screen/home.dart';
import 'package:unidrive_alpha/screen/main_screen.dart';
import 'models/carona_model.dart';
import 'models/user_model.dart';

void main() => runApp(MyApp());

 // Set default home.
  Widget _defaultHome = new MainScreen();


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CaronaModel>(
            model: CaronaModel(model),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'UniDrive',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Color(0xFF08AEA4),
                primaryColorDark: Color(0xFF00877F),
              ),
              home: _defaultHome,
              
            ),
          );
        },
      ),
    );
  }
}
