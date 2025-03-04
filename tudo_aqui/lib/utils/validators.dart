class Validators {
  // Valida um email
  static bool validarEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  // Valida um CPF
  static bool validarCPF(String cpf) {
    // Remove caracteres não numéricos
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Verifica se o CPF tem 11 dígitos
    if (cpf.length != 11) return false;

    // Verifica se todos os dígitos são iguais (ex.: 111.111.111-11)
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) return false;

    // Validação do primeiro dígito verificador
    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    int resto = soma % 11;
    int digito1 = resto < 2 ? 0 : 11 - resto;

    if (int.parse(cpf[9]) != digito1) return false;

    // Validação do segundo dígito verificador
    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    resto = soma % 11;
    int digito2 = resto < 2 ? 0 : 11 - resto;

    if (int.parse(cpf[10]) != digito2) return false;

    return true;
  }

  // Valida uma senha (mínimo 6 caracteres, pelo menos 1 número e 1 letra)
  static bool validarSenha(String senha) {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
    return regex.hasMatch(senha);
  }

  // Valida um telefone (formato: (XX) XXXXX-XXXX ou XX XXXXX-XXXX)
  static bool validarTelefone(String telefone) {
    final regex = RegExp(r'^\(?\d{2}\)?\s?\d{4,5}-?\d{4}$');
    return regex.hasMatch(telefone);
  }
}