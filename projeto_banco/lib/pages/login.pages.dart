import 'package:flutter/material.dart';
import 'package:projeto_banco/pages/cadastro.pages.dart';
import 'package:projeto_banco/pages/home.pages.dart';
import 'package:projeto_banco/repository/usuario.repository.dart';
import 'package:projeto_banco/utils/constantes.utils.dart';

class LoginPage extends StatefulWidget {

  final String? title;
  const LoginPage({Key? key, required this.title}): super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar (
        title: Text(widget.title!),
        centerTitle: mounted,
        ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                ConstantesPdv.logo,
                height: 150,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              TextFormField(
                controller: _senhaController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              
              Container(
                padding: const EdgeInsets.only(top: 30),
                width: 300,
                height: 68,
                child: ElevatedButton(
                  onPressed: () async {
                    UsuarioRepository usuarioRepo = UsuarioRepository();

                    bool verificarSenha = await usuarioRepo.verificarSenha(_senhaController.text);
                    bool verificarEmail = await usuarioRepo.verificarEmail(_emailController.text);

                    if(verificarEmail && verificarSenha) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                        ModalRoute.withName('/home'),
                      );
                    } else {
                      print("Usuário não casdastrado");
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: const Text('Entrar'),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                  ),
                ),
              
              SizedBox(
                width: 300,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: ((context) => const CadastroPage()),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green), 
                    child: const Text('Cadastrar'),
                ),
              ) 
            ],
          )
        )  
      ),
    );
  }
}