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
  int _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Cachorro", "pontuacao": 2},
        {"texto": "Gato", "pontuacao": 3},
        {"texto": "Cavalo", "pontuacao": 5},
        {"texto": "Coelho", "pontuacao": 7}
      ]
    },
    {
      "texto": "Qual sua cor favorita?",
      "respostas": [
        {"texto": "Verde", "pontuacao": 5},
        {"texto": "Amarelo", "pontuacao": 3},
        {"texto": "Azul", "pontuacao": 2},
        {"texto": "Rosa", "pontuacao": 6}
      ]
    },
    {
      "texto": "Qual seu time favorito?",
      "respostas": [
        {"texto": "Palmeiras", "pontuacao": 6},
        {"texto": "Santos", "pontuacao": 7},
        {"texto": "Botafogo", "pontuacao": 4},
        {"texto": "Vasco", "pontuacao": 3}
      ]
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
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
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario)));
  }
}
