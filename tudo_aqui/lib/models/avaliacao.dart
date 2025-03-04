class Avaliacao {
  final String id;
  final String idPedido;
  final int nota; // De 1 a 5
  final String comentario;
  final DateTime dataCriacao;

  Avaliacao({
    required this.id,
    required this.idPedido,
    required this.nota,
    required this.comentario,
    required this.dataCriacao,
  });
}