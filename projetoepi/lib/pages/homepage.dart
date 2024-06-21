import 'package:flutter/material.dart';
import 'package:projetoepi/utils/mensage.dart';
import 'package:projetoepi/widget/botao.dart';
import 'package:projetoepi/widget/field.dart';
import 'package:provider/provider.dart';
import 'package:projetoepi/Provider/login/logar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Consumer<Logar>(builder: (context, logar, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("SafeGuard"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 249, 197),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/images/person.png")),
              customTextField(
                  title: "Email",
                  controller: _email,
                  hint: 'Digite seu e-mail',
                  tipo: TextInputType.emailAddress),
              customTextField(
                title: "Senha",
                controller: _password,
                hint: "Digite sua senha",
                tipo: TextInputType.visiblePassword,
                funcao: (value) {
                logar.validaPassword(value);
                }),
                if(logar.msgError.isNotEmpty)
                Text(
                  logar.msgError,
                  style: const TextStyle(color: Colors.red)
                ),
              customButton(
                text: 'Login',
                tap: () async {
                  if (_email.text.isEmpty || _password.text.isEmpty) {
                    showMessage(
                        message: "Todos os campos são requeridos",
                        context: context);
                  } else {
                    logar.logarUsuario(_email.text, _password.text, 0);
                    if(logar.logado) {
                      Navigator.of(context).pushNamed('/dashboard');
                    } else{
                      await logar.logarUsuario(_email.text, _password.text, 0);
                      if (logar.logado) {
                        Navigator.of(context).pushNamed(logar.rota);
                      
                      }else {
                      showMessage(
                        message: "Usuário ou senha inválidos",
                        context: context,
                      );
                    }
                  }
                }},
                context: context,
                status: logar.carregando
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cadastro');
                  },
                  child: const Text('Cadastre-se agora!'))
            ],
          ),
        ),
      );
    });
  }
}
