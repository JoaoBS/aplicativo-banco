import 'package:flutter/material.dart';
import 'package:projeto_banco/main.dart';
import 'package:projeto_banco/models/usuario.model.dart';
import 'package:projeto_banco/pages/login.pages.dart';
import 'package:projeto_banco/repository/usuario.repository.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  TextEditingController _nomeDoUsuarioController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nomeRuaController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Pagina de Cadastro",
          ),
        centerTitle: mounted,
        backgroundColor: Colors.green,
      ),

      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nomeDoUsuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _cpfController,
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _idadeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Idade',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nomeRuaController,
                  decoration: const InputDecoration(
                    labelText: 'Rua',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _confirmarSenhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    if(_senhaController.text == _confirmarSenhaController.text) {
                      UsuarioModel usuario = UsuarioModel(
                        nomeDoUsuario: _nomeDoUsuarioController.text,
                        cpf: _cpfController.text,
                        idade: int.parse(_idadeController.text),
                        email: _emailController.text,
                        nomeRua: _nomeRuaController.text,
                        senha: _senhaController.text,
                      );

                      UsuarioRepository usuarioRepo = UsuarioRepository();

                      await usuarioRepo.salvarUsuario(usuario);

                      Navigator.pop(context);
                    }
                  },
                  child: Text("Cadastrar"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 40),
                    primary: Colors.green,
                  ),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}