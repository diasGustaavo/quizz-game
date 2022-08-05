import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a capital nacional da linguiça?',
      'respostas': [
        {'texto': 'Bragança Paulista', 'pontuacao': 10},
        {'texto': 'Ouro Preto', 'pontuacao': 0},
        {'texto': 'Varginha', 'pontuacao': 0},
        {'texto': 'João Pessoa', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual lago mais fundo do mundo?',
      'respostas': [
        {'texto': 'Baikal', 'pontuacao': 10},
        {'texto': 'Lagoa Palmas', 'pontuacao': 0},
        {'texto': 'Tanganyika', 'pontuacao': 7},
        {'texto': 'Mar Cáspio', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual a lingua mais falada do mundo?',
      'respostas': [
        {'texto': 'Hindi', 'pontuacao': 2},
        {'texto': 'Mandarim', 'pontuacao': 10},
        {'texto': 'Ingles', 'pontuacao': 5},
        {'texto': 'Espanhol', 'pontuacao': 7},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
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
          title: const Text('Quizz App'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
