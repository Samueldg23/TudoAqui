class Formatters {
  // Formata uma data no padrão brasileiro (dd/MM/yyyy)
  static String formatarData(DateTime data) {
    return "${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}";
  }

  // Formata um telefone no padrão (XX) XXXXX-XXXX
  static String formatarTelefone(String telefone) {
    telefone = telefone.replaceAll(RegExp(r'[^0-9]'), ''); // Remove não numéricos
    if (telefone.length == 11) {
      return "(${telefone.substring(0, 2)}) ${telefone.substring(2, 7)}-${telefone.substring(7)}";
    }
    return telefone; // Retorna o número sem formatação se não tiver 11 dígitos
  }

  // Formata um CPF no padrão XXX.XXX.XXX-XX
  static String formatarCPF(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), ''); // Remove não numéricos
    if (cpf.length == 11) {
      return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
    }
    return cpf; // Retorna o CPF sem formatação se não tiver 11 dígitos
  }

  // Formata um valor monetário no padrão R$ 1.234,56
  static String formatarMoeda(double valor) {
    return "R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',').replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.')}";
  }
}