import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:unidrive_alpha/models/user_model.dart';
import 'package:unidrive_alpha/screen/auth/signup.dart';
import 'package:unidrive_alpha/screen/auth/termos.dart';
import 'package:unidrive_alpha/screen/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(
        //   // leading: new IconButton(
        //   //   icon: new Icon(Icons.arrow_back, color: Colors.white),
        //   //   onPressed: () => Navigator.of(context).pop(),
        //   // ),
        //   elevation: 0,
        //   backgroundColor: Theme.of(context).primaryColor,
        //   actions: <Widget>[
        //     FlatButton(
        //       child: Text(
        //         "Termos de Uso",
        //         semanticsLabel: "Termos de Uso",
        //         style: TextStyle(
        //           fontSize: 15.0,
        //           color: Colors.white,
        //           fontFamily: 'Montserrat',
        //         ),
        //       ),
        //       textColor: Color(0xFF08AEA4),
        //       onPressed: () {
        //          Navigator.of(context).pushReplacement(MaterialPageRoute(
        //                     builder: (context) => TermosScreen()));
        //       },
        //     ),
        //   ],
        // ),
        body: ScopedModelDescendant<UserModel>(

            ///scopped adicionado para poder "atualizar todo o app quando um usuario estiver logado, por exemplo"
            builder: (context, child, model) {
          //adicionado junto com scopped - criamos uma forma de acessar o nosso model
          if (model.isLoading)
            return Center(child: CircularProgressIndicator(strokeWidth: 1), );

          return Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.fromLTRB(20, 100, 20, 120),
            child: Form(
              key: _formKey, //faz meu validator funcionar
              child: ListView(
                padding: EdgeInsets.all(36.0),
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      semanticsLabel: 'Tela de Login',
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  Text(
                    "Email",
                    semanticsLabel: 'Email',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  // SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70)),
                      hintText: "Insira seu email",
                      hintStyle: TextStyle(
                        //fontWeight: FontWeight.bold
                        fontFamily: 'Montserrat',
                        color: Colors.white60,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido!";
                    },
                  ),

                  SizedBox(
                    height: 16.0,
                  ),

                  Text(
                    "Senha",
                    semanticsLabel: 'Senha',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  TextFormField(
                      controller: _passController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70)),
                        hintText: "Insira sua senha",
                        hintStyle: TextStyle(
                          //fontWeight: FontWeight.bold
                          fontFamily: 'Montserrat',
                          color: Colors.white60,
                        ),
                      ),
                      obscureText: true,
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Senha inválida!";
                      }),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                         if (_emailController.text.isEmpty)
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content:
                                Text("Insira e-mail para recuperar senha."),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                          ));
                        else {
                          model.recoverPass(_emailController.text);
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Confira seu e-mail!"),
                            backgroundColor: Colors.black54,
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                      child: Text(
                        "Esqueceu a senha?",
                        semanticsLabel: 'Esqueceu a senha?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                      ),
                      padding: EdgeInsets
                          .zero, //faz meu botão ficar bem colado a direita (máximo do scaffold)
                    ),
                  ),
                  SizedBox(height: 34),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //side: BorderSide(color: Colors.red),
                    ),
                    child: Text(
                      "Entrar",
                      semanticsLabel: 'Botão de Entrar',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    color: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}

                      model.signIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail);
                    },
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Cadastrar",
                        semanticsLabel: 'Botão de Cadastrar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                        ),
                      ),
                      padding: EdgeInsets
                          .zero, //faz meu botão ficar bem colado a direita (máximo do scaffold)
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  void _onSuccess() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Home()));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao entrar!", semanticsLabel: 'Falha ao Entrar',),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
