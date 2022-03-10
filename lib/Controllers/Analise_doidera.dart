import 'dart:math';

class Doidera {
  final _diagnosticodoidera = [
    'Você não estava doido nessa hora',
    'Você estava um pouco doido nessa hora',
    'Você estava muito doido nessa hora'
  ];
  final DateTime now = DateTime.now();

  Doidera();

  String getfrase() {
    var rnd = Random();
    int _num = rnd.nextInt(3);
    return _diagnosticodoidera[_num];
  }

  String getHora() {
    return '${now.hour}:${now.minute}:${now.second}';
  }

  @override
  String toString() {
    var rnd = Random();
    int _num = rnd.nextInt(3);
    return '${_diagnosticodoidera[_num]}\n${now.hour}:${now.minute}:${now.second}';
  }

  // String toString() {
  //   return _diagnosticodoidera[_num];
  // }
// final String cla1 = 'Não esta doido nessa hora.';
// final String cla2 = 'Esta um pouco doido nessa hora?!';
// final String cla3 = 'Esta muido doido essa hora!!';
}
