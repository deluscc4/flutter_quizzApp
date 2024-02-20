import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audioplayers.dart';

Helper helper = Helper();

void main() => runApp(QuizzApp());

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int respostasCertas = 0;
  List<Icon> marcadorDePontos = [];

  void conferirResposta(bool respostaSelecionadaPeloUsuario) {
    final player = AudioPlayer();
    bool? respostaCerta = helper.obterRespostaCorreta();
    setState(() {
      if (helper.confereFimDaExecucao() == true) {
        if (respostaSelecionadaPeloUsuario == respostaCerta) {
          player.play(AssetSource('acertou-mizeravijk.mp3'));
          marcadorDePontos.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        }
        else {
          player.play(AssetSource('faustao-errou.mp3'));
          marcadorDePontos.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        };
        int n = helper.obterNumeroQuestoes();
        Alert(
          context: context,
          type: AlertType.none,
          title: "Fim do quiz!",
          desc: "Você respondeu todas as perguntas. Seu resultado foi $respostasCertas respostas certas de $n questões.",
          buttons: [
            DialogButton(
              child: Text(
                "Show!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        helper.resetarQuestoes();
        marcadorDePontos.clear();
      } else if (respostaSelecionadaPeloUsuario == respostaCerta) {
        respostasCertas++;
        player.play(AssetSource('acertou-mizeravijk.mp3'));
        marcadorDePontos.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        }
      else {
        player.play(AssetSource('faustao-errou.mp3'));
        marcadorDePontos.add(Icon(
        Icons.close,
        color: Colors.red,
        ));
      };
      helper.proximaPergunta();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.obterQuestao() ?? "Questão não encontrada.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // helper._bancoDePerguntas = null;

                conferirResposta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
              ),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirResposta(false);
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        )
      ],
    );
  }
}

/*
pergunta1: 'O metrô é um dos meios de transporte mais seguros do mundo', verdadeiro,
pergunta2: 'A culinária brasileira é uma das melhores do mundo.', verdadeiro,
pergunta3: 'Vacas podem voar, assim como peixes d\'agua utilizam os pés para andar.', falso,
*/
