import 'package:flutter/material.dart';
import 'package:unidrive_alpha/datas/carona_data.dart';

class HomeOption extends StatefulWidget {
  BorderRadiusGeometry ContainerBorderRadius;
  double ContainerHeight;
  Function func;
  String title1;
  String title2;
  Color backColor;
  Color fontColor;
  double fontsize;
  bool isButtonDisabled;
  Carona caronas;


  HomeOption({
    this.ContainerBorderRadius,
    this.ContainerHeight,
    @required this.func,
    @required this.title1,
    @required this.title2,
    @required this.backColor,
    @required this.fontColor,
    @required this.isButtonDisabled,
  });

  @override
  _HomeOptionState createState() => _HomeOptionState();
}

class _HomeOptionState extends State<HomeOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.widget.ContainerHeight,
        decoration: new BoxDecoration(
          color: this.widget.backColor,
          borderRadius: this.widget.ContainerBorderRadius,
        ),
        child: Container(
          height: double.maxFinite,
          child: FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.widget.title1,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: this.widget.fontColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      this.widget.title2,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: this.widget.fontColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
            onPressed: this.widget.isButtonDisabled ? null : this.widget.func,
          ),
        ));
  }
}
