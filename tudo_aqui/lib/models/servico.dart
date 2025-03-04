class Servico {
  final String id;
  final String idCategoria;
  final String nome;
  final String descricao;
  final DateTime dataCriacao;
  final DateTime dataAtualizacao;

  Servico({
    required this.id,
    required this.idCategoria,
    required this.nome,
    required this.descricao,
    required this.dataCriacao,
    required this.dataAtualizacao,
  });
}