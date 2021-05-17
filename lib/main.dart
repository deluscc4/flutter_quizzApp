import 'package:flutter/material.dart';
import 'helper.dart';
//TODO: Passo 2 - Importe o pacote rflutter_alert aqui.

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
  List<Icon> marcadorDePontos = [];

  void conferirResposta(bool respostaSelecionadaPeloUsuario) {
    bool respostaCerta = helper.obterRespostaCorreta();

    setState(() {
      //TODO: Passo 4 - Use o IF/ELSE para verificar se chegou-se ao fim do quiz. Se isso for verdadeiro (true), siga os passos: 4.a, 4.b, 4.c e 4.d
      //TODO: Passo 4.a) - Mostre um alerta utilizando o pacote rflutter_alert (se ficar em dúvida dê uma olhada na documentação do pacote: https://pub.dev/packages/rflutter_alert).
      //TODO: Passo 4.c) - Reinicie o valor da propriedade _numeroDaQuestaoAtual.
      //TODO: Passo 4.d) - Esvazie a lista marcadorDePontos para uma nova rodada.

      //TODO: Passo 5 - 'Se' não for o fim da execução do app ainda, ou seja, se não estivermos na última questão, entre na estrutura condicional e continue com a verificação da resposta.
      if (respostaSelecionadaPeloUsuario == respostaCerta) {
        marcadorDePontos.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        marcadorDePontos.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      //Usuário pressiona o botão verdadeiro.

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
                helper.obterQuestao(),
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
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.deepPurple,
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
            child: FlatButton(
              color: Colors.grey.shade800,
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
