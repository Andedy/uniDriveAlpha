import 'package:flutter/material.dart';
import 'package:unidrive_alpha/screen/home.dart';

import 'my_cars_screen.dart';

class DeleteCarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: new IconButton(
      //     padding: EdgeInsets.only(top: 16, left: 16),
      //     icon: new Icon(
      //       Icons.arrow_back,
      //       color: Color(0xFF08AEA4),
      //       size: 34,
      //     ),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      backgroundColor: Color(0xFF292929),
      body: Container(
        child: Column(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.only(top: 24),
            //   color: Color(0xFF292929),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Text(
            //           "Meus",
            //           style: TextStyle(
            //               fontFamily: 'Montserrat',
            //               color: Colors.white,
            //               fontSize: 40,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           "Veículos",
            //           style: TextStyle(
            //               fontFamily: 'Montserrat',
            //               color: Colors.white,
            //               fontSize: 40,
            //               fontWeight: FontWeight.w300),
            //         ),
            //       ]),
            // ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 0),
                color: Color(0xFF292929),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Deseja excluir FORD KÁ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          // Padding(
                          //   padding: EdgeInsets.all(50),
                          // ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.white),
                            ),
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            color: Colors.transparent,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(width: 20),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              //side: BorderSide(color: Colors.red),
                            ),
                            child: Text(
                              "Sim",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                            color: Colors.redAccent,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyCarsScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
