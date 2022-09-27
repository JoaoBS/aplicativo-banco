import 'dart:convert';
import 'package:projeto_banco/models/usuario.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepository {
  final Future<SharedPreferences> repo = SharedPreferences.getInstance();

  Future<void> salvarUsuario(UsuarioModel usuario) async {
    SharedPreferences localRepo = await repo;
    await localRepo.setString('usuario', usuario.toString());
  }

  Future<String?> pegarDadosDoUsuario() async {
    SharedPreferences localRepo = await repo;
    return localRepo.getString("usuario");
  }

  verificarSenha(String senhaDigitada) async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    if(senhaDigitada == dadosDoUsuario["senha"]) {
      return true;
    }
    return false;
  }

  verificarEmail(String emailDigitado) async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    if(emailDigitado == dadosDoUsuario["email"]) {
      return true;
    }
    return false;
  }

  Future<String?> retornarNomeDoUsuario() async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    return dadosDoUsuario["nomeDoUsuario"];
  }

  Future<String?> retornarCpfDoUsuario() async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    return dadosDoUsuario["cpfDoUsuario"];
  }

  Future<String?> retornarIdadeDoUsuario() async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    return dadosDoUsuario["idade"].toString();
  }

  Future<String?> retornarEmailDoUsuario() async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    return dadosDoUsuario["email"];
  }

  Future<String?> retornarRuaDoUsuario() async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    return dadosDoUsuario["nomeDaRua"];
  }

  Future<String?> retornarSenhaDoUsuario() async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    return dadosDoUsuario["senha"];
  }
}