class Usuario {
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String endereco;
  final String fotoPerfil;
  final String tipoUsuario; // cliente, prestador ou admin
  final DateTime dataCriacao;
  final DateTime dataAtualizacao;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.fotoPerfil,
    required this.tipoUsuario,
    required this.dataCriacao,
    required this.dataAtualizacao,
  });
}