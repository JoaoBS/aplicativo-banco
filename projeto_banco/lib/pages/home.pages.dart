import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projeto_banco/pages/login.pages.dart';
import 'package:projeto_banco/repository/usuario.repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nomeDoUsuario = "";
  String _cpfDoUsuario = "";
  String _idade = "";
  String _email = "";
  String _nomeDaRua = "";

  UsuarioRepository usuarioRepo = UsuarioRepository();

  carregarDadosDoUsuario() async {
    String? nome = await usuarioRepo.retornarNomeDoUsuario();
    String? cpf = await usuarioRepo.retornarCpfDoUsuario();
    String? idade = await usuarioRepo.retornarIdadeDoUsuario();
    String? email = await usuarioRepo.retornarEmailDoUsuario();
    String? rua = await usuarioRepo.retornarRuaDoUsuario();
    
    setState(() {
      _nomeDoUsuario = nome!;
      _cpfDoUsuario = cpf!;
      _idade = idade!;
      _email = email!;
      _nomeDaRua = rua!;
    });
  }

  @override
  Widget build(BuildContext context) {

    carregarDadosDoUsuario();

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "Bem Vindo(a) $_nomeDoUsuario",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: mounted,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            tooltip: "Deslogar",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                  builder: (context) => const LoginPage(title: "Login")
                ),
                ModalRoute.withName('/login'),
            );
          },
          icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                '\nCPF: $_cpfDoUsuario'
                '\nIdade: $_idade'
                '\nEmail: $_email'
                '\nRua: $_nomeDaRua',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}