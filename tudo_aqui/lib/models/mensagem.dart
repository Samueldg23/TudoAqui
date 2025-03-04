class Mensagem {
  final String id;
  final String idRemetente;
  final String idDestinatario;
  final String conteudo;
  final DateTime dataEnvio;
  final bool lida;

  Mensagem({
    required this.id,
    required this.idRemetente,
    required this.idDestinatario,
    required this.conteudo,
    required this.dataEnvio,
    required this.lida,
  });
}