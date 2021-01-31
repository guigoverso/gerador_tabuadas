import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tabuada extends StatefulWidget {
  @override
  _TabuadaState createState() => _TabuadaState();
}

class _TabuadaState extends State<Tabuada> {
  TextEditingController numeroController = TextEditingController();
  int numero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
                title: numero == null
                    ? Text('Gerar tabuada')
                    : Text('Tabuada de ')),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: <Widget>[
                  NumeroInput(),
                  Expanded(child: ListaTabuada(context: context))
                ],
              ),
            )));
  }

  Widget NumeroInput() {
    return TextField(
      controller: numeroController,
      onSubmitted: (String value) {
        if (value.isEmpty) return;
        int novoNumero = int.parse(value);

        setState(() {
          numero = novoNumero;
        });
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
          labelText: 'Insira um número',
          labelStyle: TextStyle(color: Colors.green),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.5),
          )),
    );
  }

  Widget ListaTabuada({BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: numero == null
          ? null
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                      padding:
                          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  wordSpacing: 15.0),
                              children: <TextSpan>[
                            TextSpan(
                                text: '$numero',
                                style: TextStyle(color: Colors.green)),
                            TextSpan(
                                text: ' x ',
                                style: TextStyle(color: Colors.black45)),
                            TextSpan(
                                text: '$index',
                                style: TextStyle(color: Colors.blue)),
                            TextSpan(
                                text: ' = ',
                                style: TextStyle(color: Colors.black45)),
                            TextSpan(
                                text: '${numero * index}',
                                style: TextStyle(color: Colors.red))
                          ]))),
                );
              },
            ),
    );
  }
}
