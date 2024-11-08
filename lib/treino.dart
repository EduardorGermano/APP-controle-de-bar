import 'package:flutter/material.dart';

class Treino extends StatefulWidget {
  @override
  State<Treino> createState() => _TreinoState();
}

class _TreinoState extends State<Treino> {
  Widget build(BuildContext context) {
    String valor = '';
    var parametro = ModalRoute.of(context);
    if (parametro != null) {
      valor = parametro.settings.arguments as String;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Treino ${valor}'),
      ),
    );
  }
}
