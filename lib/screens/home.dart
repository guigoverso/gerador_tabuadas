import 'package:flutter/material.dart';
import 'tabuada.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerador de tabuadas'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Icon(
                Icons.calculate,
                size: 200.0,
                color: Colors.green,
              ),
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  ButtonMenu(
                      text: 'Gerar tabuada',
                      action: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Tabuada()))),
                  ButtonMenu(
                      text: 'Exercícios', action: () => print('Clicked 2'))
                ]))
          ],
        ),
      ),
    );
  }

  Widget ButtonMenu(
      {@required String text, VoidCallback action, List parameters}) {
    return Container(
        width: 150,
        height: 60,
        margin: EdgeInsets.only(bottom: 20.0),
        child: FlatButton(
          onPressed: action == null ? null : action,
          child: Text(text),
          color: Colors.green,
          splashColor: Colors.lightGreen,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ));
  }
}
