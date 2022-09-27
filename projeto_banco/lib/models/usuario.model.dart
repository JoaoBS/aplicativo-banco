import 'dart:convert';

class UsuarioModel {
  int? id;
  String? nomeDoUsuario;
  String? cpf;
  int? idade;
  String? email;
  String? nomeRua;
  String? senha;

  UsuarioModel(
    {required this.nomeDoUsuario, 
    required this.cpf,
    required this.idade,
    required this.email,
    required this.nomeRua,
    required this.senha,
    });

    Map<String, dynamic> toJson() {
    return {
      "nomeDoUsuario": nomeDoUsuario,
      "cpfDoUsuario": cpf,
      "idade": idade,
      "email": email,
      "nomeDaRua": nomeRua,
      "senha": senha,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}