import 'package:flutter/material.dart';

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormTransferencia(),
      ),
    );
  }
}

// formulário
class FormTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fazer transferencia"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
            child: TextField(
              controller: _controladorCampoConta,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                  labelText: 'Número da conta', hintText: "0000"),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: "valor",
                  hintText: "000,00"),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text("Confirmar!"),
            onPressed: () {
              final int numConta = int.tryParse(_controladorCampoConta.text);
              final double numValor =
                  double.tryParse(_controladorCampoValor.text);

              if (numValor != null && numConta != null) {
                final transferenciaCriada = Transferencia(numValor, numConta);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('funcionou!'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// interface
class Transferencia {
  final double valor;
  final int conta;

  Transferencia(this.valor, this.conta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, conta: $conta';
  }
}

// class apoio
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}

// Listagem de transferencias

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferencias"),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(11.7, 23)),
          ItemTransferencia(Transferencia(71.5, 22)),
          ItemTransferencia(Transferencia(56.7, 52)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
