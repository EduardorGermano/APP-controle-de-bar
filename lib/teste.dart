import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  var texto = 'boa noite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'treino', arguments: texto)
                    .then((value) {
                  setState(() {
                    texto = 'atualizou';
                  });
                });
              },
              child: Text('Ok'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'formulario', arguments: texto)
                    .then((value) {
                  setState(() {
                    texto = 'preencha o formulario';
                  });
                });
              },
              child: Text('Formulario'),
            ),
          ],
        ),
      ),
    );
  }
}
