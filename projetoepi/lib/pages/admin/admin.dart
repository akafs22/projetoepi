import 'package:flutter/material.dart';
import 'package:projetoepi/widget/botao.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Administrativo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const Text("Bemn-vindo"),
              customButton(
                  text: "Cadastrar Epi",
                  tap: () {
                    Navigator.pushNamed(context, '/adminepi');
                  },
                  context: context),
              customButton(
                  text: "Cadastrar Funcionário",
                  tap: () {
                    Navigator.pushNamed(context, '/admfunc');
                  },
                  context: context),
              customButton(
                  text: "Cadastrar Entrega",
                  tap: () {
                    Navigator.pushNamed(context, '/admentrega');
                  },
                  context: context)
            ],
          ),
        ),
      ),
    );
  }
}
