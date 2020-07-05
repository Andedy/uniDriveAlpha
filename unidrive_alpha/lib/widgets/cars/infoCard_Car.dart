import 'package:flutter/material.dart';
import 'package:unidrive_alpha/datas/car_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfoCardCar extends StatelessWidget {
  final Car car;

  InfoCardCar(this.car);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
            color: Color(0xFF222222),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                offset: new Offset(0, 1),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  car.nome,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  car.placa,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
