import 'perguntas.dart';

class Helper {
  int _numeroDaQuestaoAtual = 0;

  List<Perguntas> _bancoDePerguntas = [
    Perguntas(
        'O metrô é um dos meios de transporte mais seguros do mundo.', true),
    Perguntas('A culinária brasileira é uma das melhores do mundo.', true),
    Perguntas('Vacas podem voar, assim como peixes utilizam os pés para andar.',
        false),
    Perguntas('A maioria dos peixes podem viver fora da água.', false),
    Perguntas('A lâmpada foi inventada por um brasileiro.', false),
    Perguntas(
        'É possível utilizar a carteira de habilitação de carro para dirigir um avião.',
        false),
    Perguntas('O Brasil possui 26 estados e 1 Distrito Federal.', true),
    Perguntas(
        'Bitcoin é o nome dado a uma das moedas virtuais mais famosas.', true),
    Perguntas('1 minuto equivale a 60 segundos.', true),
    Perguntas('1 segundo equivale a 200 milissegundos.', false),
    Perguntas(
        'O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.',
        true),
    Perguntas('Ler após uma refeição prejudica a visão humana.', false),
    Perguntas(
        'O cartão de crédito pode ser considerado uma moeda virtual.', false),
  ];

  void proximaPergunta() {
    if (_numeroDaQuestaoAtual < _bancoDePerguntas.length - 1) {
      _numeroDaQuestaoAtual++;
    }
    print(_numeroDaQuestaoAtual);
    print(_bancoDePerguntas.length);
  }

  String obterQuestao() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].questao;
  }

  bool obterRespostaCorreta() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].respostaDaQuestao;
  }

//TODO: Passo 3.a) - Crie um método chamado confereFimDaExecucao() que verifica se a última questão foi alcançada. Caso isso tenha ocorrido, devemos ter um retorno indicando, que pode ser por exemplo, um boleano como o 'true'. Caso ainda não seja a última questão, você pode por exemplo, retornar um 'false'.

//TODO: Passo 3.b) - Use um 'print' para verificar se o método confereFimDaExecucao() está funcionando como deveria, ou seja, retornando true para quando for a última questão da lista.

//TODO: Passo 4.b) - Crie um método para resetar o valor da propriedade _numeroDaQuestaoAtual para 0, quando for necessário.

}
