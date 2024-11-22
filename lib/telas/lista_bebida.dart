import 'package:flutter/material.dart';
import '../app/dominio/dto/dto_bebida.dart';

class ListaBebida extends StatefulWidget {
  @override
  State<ListaBebida> createState() => _ListaBebidaState();
}

class _ListaBebidaState extends State<ListaBebida> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _mlController = TextEditingController();

  final List<DTOBebida> _bebidas = [];

  @override
  void dispose() {
    _nomeController.dispose();
    _quantidadeController.dispose();
    _mlController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final novaBebida = DTOBebida(
        nome: _nomeController.text,
        quantidade: int.parse(_quantidadeController.text),
        ml: int.parse(_mlController.text),
      );

      setState(() {
        _bebidas.add(novaBebida);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Bebida "${novaBebida.nome}" adicionada à lista!')),
      );

      _limparCampos();
    }
  }

  void _limparCampos() {
    _nomeController.clear();
    _quantidadeController.clear();
    _mlController.clear();
  }

  void _removerBebida(int index) {
    setState(() {
      _bebidas.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bebida removida com sucesso!')),
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
        child: Column(
          children: [
            Form(
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
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _bebidas.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhuma bebida adicionada ainda!',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _bebidas.length,
                      itemBuilder: (context, index) {
                        final bebida = _bebidas[index];
                        return Card(
                          child: ListTile(
                            title: Text(bebida.nome),
                            subtitle: Text(
                                'Quantidade: ${bebida.quantidade} | ML: ${bebida.ml}'),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removerBebida(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
