import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetoepi/Provider/Admin/colaborador.dart';
import 'package:projetoepi/utils/mensage.dart';
import 'package:projetoepi/widget/botao.dart';
import 'package:projetoepi/widget/field.dart';
import 'package:provider/provider.dart';

class AdminFunc extends StatefulWidget {
  const AdminFunc({super.key});

  @override
  State<AdminFunc> createState() => _AdminFuncState();
}

class _AdminFuncState extends State<AdminFunc> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _ctps = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dataAdmissao = TextEditingController();

  @override
  @override
  void dispose() {
    _nome.clear();
    _ctps.clear();
    _telefone.clear();
    _cpf.clear();
    _email.clear();
    _dataAdmissao.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColaboradorProvider>(builder: (context, colabprovider, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Administrativo'),
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Center(
                child: Column(
                  children: [
                    customTextField(
                        title: 'Nome do funcionário',
                        controller: _nome,
                        hint: 'Digite o nome do funcionário',
                        tipo: TextInputType.text),
                    customTextField(
                        title: 'Ctps',
                        controller: _ctps,
                        hint: 'Digite o ctps do funcionário',
                        tipo: TextInputType.text),
                    customTextField(
                        title: 'Telefone',
                        controller: _telefone,
                        hint: 'Digite o telefone do funcionário',
                        tipo: TextInputType.phone,
                        formatacao: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ]),
                    customTextField(
                        title: 'Cpf',
                        controller: _cpf,
                        hint: 'Digite o cpf do funcionário',
                        tipo: TextInputType.number,
                        formatacao: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter()
                        ]),
                    customTextField(
                        title: 'E-mail',
                        controller: _email,
                        hint: 'Digite o email do funcionário',
                        tipo: TextInputType.emailAddress),
                    customTextField(
                        title: 'Data de admissão',
                        controller: _dataAdmissao,
                        hint: 'Digite a data de admissão do funcionário',
                        tipo: TextInputType.datetime,
                        formatacao: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter(),
                        ]),
                    customButton(
                        tap: () {
                          if (_formKey.currentState!.validate()) {
                            colabprovider.cadastrar(
                                context,
                                _nome.text,
                                _ctps.text,
                                _telefone.text,
                                _cpf.text,
                                _email.text,
                                _dataAdmissao.text);
                          } else {
                            showMessage(
                                message:
                                    "Todos os campos devem ser preenchidos",
                                context: context);
                          }
                        },
                        text: "Concluir",
                        context: context,
                        status: colabprovider.carregando)
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
