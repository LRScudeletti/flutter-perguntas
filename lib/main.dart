import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(PerguntasApp());

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}

class _PerguntasAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Cachorro", "nota": 5},
        {"texto": "Gato", "nota": 8},
        {"texto": "Cavalo", "nota": 10},
        {"texto": "Coelho", "nota": 7}
      ]
    },
    {
      "texto": "Qual sua cor favorita?",
      "respostas": [
        {"texto": "Verde", "nota": 9},
        {"texto": "Amarelo", "nota": 10},
        {"texto": "Azul", "nota": 8},
        {"texto": "Rosa", "nota": 5}
      ]
    },
    {
      "texto": "Qual seu time favorito?",
      "respostas": [
        {"texto": "Palmeiras", "nota": 6},
        {"texto": "Santos", "nota": 7},
        {"texto": "Botafogo", "nota": 4},
        {"texto": "Vasco", "nota": 10}
      ]
    }
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("PerguntasApp"),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder)
                : Resultado()));
  }
}
