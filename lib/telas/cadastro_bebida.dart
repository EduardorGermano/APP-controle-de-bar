import 'package:flutter/material.dart';
import '../app/dominio/dto/dto_bebida.dart';

class CadastroBebida extends StatefulWidget {
  @override
  State<CadastroBebida> createState() => _CadastroBebidaState();
}

class _CadastroBebidaState extends State<CadastroBebida> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _mlController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _quantidadeController.dispose();
    _mlController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      DTOBebida novaBebida = DTOBebida(
        nome: _nomeController.text,
        quantidade: int.parse(_quantidadeController.text),
        ml: int.parse(_mlController.text),
      );

      // Feedback ao usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Bebida "${novaBebida.nome}" salva com sucesso!')),
      );

      // Imprime no console para testes
      print('Nome da Bebida: ${novaBebida.nome}');
      print('Quantidade: ${novaBebida.quantidade}');
      print('ML: ${novaBebida.ml}');
    }
  }

  void _limparCampos() {
    _nomeController.clear();
    _quantidadeController.clear();
    _mlController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Campos limpos!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Bebida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome da Bebida'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome da bebida';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(labelText: 'Quantidade'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade';
                    } else if (int.tryParse(value) == null) {
                      return 'Insira um valor numérico válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _mlController,
                  decoration: InputDecoration(labelText: 'ML'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o valor em ML';
                    } else if (int.tryParse(value) == null) {
                      return 'Insira um valor numérico válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Salvar'),
                    ),
                    ElevatedButton(
                      onPressed: _limparCampos,
                      child: Text('Limpar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
