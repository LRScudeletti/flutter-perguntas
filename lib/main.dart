import 'package:flutter/material.dart';
import './questao.dart';

void main() => runApp(PerguntasApp());

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}

class _PerguntasAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      "Qual é o seu animal favorito?",
      "Qual sua cor favorita?"
    ];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("PerguntasApp"),
            ),
            body: Column(
              children: <Widget>[
                Questao(perguntas.elementAt(_perguntaSelecionada)),
                ElevatedButton(
                    onPressed: _responder, child: Text("Reposta 01")),
                ElevatedButton(
                    onPressed: _responder, child: Text("Reposta 02")),
                ElevatedButton(onPressed: _responder, child: Text("Reposta 03"))
              ],
            )));
  }
}
