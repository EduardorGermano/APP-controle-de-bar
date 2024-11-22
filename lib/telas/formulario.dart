import 'package:flutter/material.dart';
import 'package:controle_de_bar/app/dominio/dto/dto_bar.dart';

class Formulario extends StatefulWidget {
  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _localizacaoController = TextEditingController();
  final _estoqueController = TextEditingController();
  final _responsavelController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _localizacaoController.dispose();
    _estoqueController.dispose();
    _responsavelController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      DTOBar novoBar = DTOBar(
        nome: _nomeController.text,
        localizacao: _localizacaoController.text,
        estoqueAtual: int.parse(_estoqueController.text),
        responsavel: _responsavelController.text,
      );

      print('Nome do Bar: ${novoBar.nome}');
      print('Localização: ${novoBar.localizacao}');
      print('Estoque Atual: ${novoBar.estoqueAtual}');
      print('Responsável: ${novoBar.responsavel}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário do Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome do Bar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do bar';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _localizacaoController,
                decoration: InputDecoration(labelText: 'Localização'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a localização';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _estoqueController,
                decoration: InputDecoration(labelText: 'Estoque Atual'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o estoque atual';
                  } else if (int.tryParse(value) == null) {
                    return 'Insira um valor numérico válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _responsavelController,
                decoration: InputDecoration(labelText: 'Responsável'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o responsável';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
