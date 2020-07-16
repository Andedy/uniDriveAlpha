import 'package:flutter/material.dart';
import 'package:unidrive_alpha/screen/Cars/my_cars_screen.dart';
import 'package:unidrive_alpha/screen/auth/termos.dart';
import 'package:unidrive_alpha/screen/home.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (page == 0) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          } else if (page == 1){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => TermosScreen()));
          } else if (page == 4) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          }
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
