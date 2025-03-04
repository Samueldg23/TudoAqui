class Pedido {
  final String id;
  final String idCliente;
  final String idServicoPrestador;
  final DateTime dataAgendada;
  final String status; // pendente, aceito, em_andamento, concluido, cancelado
  final String descricao;
  final DateTime dataCriacao;
  final DateTime dataAtualizacao;

  Pedido({
    required this.id,
    required this.idCliente,
    required this.idServicoPrestador,
    required this.dataAgendada,
    required this.status,
    required this.descricao,
    required this.dataCriacao,
    required this.dataAtualizacao,
  });
}