import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/Admin/cadapi.dart';
import 'package:projetoepi/Provider/Admin/colaborador.dart';
import 'package:projetoepi/Provider/Admin/entrega.dart';
import 'package:projetoepi/Provider/cadastro/valida_login.dart';
import 'package:projetoepi/Provider/cadastro/verifica_usuario.dart';
import 'package:projetoepi/Provider/login/logar.dart';
import 'package:projetoepi/pages/admin/adm_entrega.dart';
import 'package:projetoepi/pages/admin/adm_epi.dart';
import 'package:projetoepi/pages/admin/adm_func.dart';
import 'package:projetoepi/pages/admin/admin.dart';
import 'package:projetoepi/pages/admin/entrega/dataentrega.dart';
import 'package:projetoepi/pages/admin/entrega/escolheepi.dart';
import 'package:projetoepi/pages/dashboard.dart';
import 'package:projetoepi/pages/homepage.dart';
import 'package:projetoepi/pages/signup_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (_) => ValidarSenha(),),  
      ChangeNotifierProvider(create: (_) => UsuarioCadastro()),
      ChangeNotifierProvider(create: (_) => Logar()),
      ChangeNotifierProvider(create: (_) => ColaboradorProvider()),
      ChangeNotifierProvider(create: (_) => CadEpiProvider()),
      ChangeNotifierProvider(create: (_) => EntregaProvider()),
    ],
    child: MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => const HomePage(),
      '/cadastro' : (context) => const SignupScreen(),
      '/dashboard' : (context) => const Dashboard(),
      '/admin' : (context) => const Admin(),
      '/admentrega' : (context) => const AdminEntrega(),
      '/adminepi' : (context) => const AdminEpi(),
      '/admfunc' : (context) => const AdminFunc(),
      '/episentrega' : (context) => const EpisScreen(),
      '/entrega' : (context) => EntregaScreen(),
    },
    debugShowCheckedModeBanner: false,
  )));
}