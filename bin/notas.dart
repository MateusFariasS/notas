import 'dart:io';

void main() {
  List<String> notas = <String>[];
  menu(notas);
}

String getComando() {
  print(
    "DIGITE UM COMANDO : 1 - ADICIONAR NOTA ; 2 - LISTAR NOTAS ; 3 - SAIR ",
  );
  List<String> comandos = <String>["1", "2", "3"];
  String? entrada = "";

  entrada = stdin.readLineSync();

  if (entrada == null || !comandos.contains(entrada)) {
    print("COMANDO INVÁLIDO");
    getComando();
  }

  return entrada!;
}

List<String> adicionarNota(List<String> notas) {
  print("ESCREVA UMA NOTA:");
  String? nota = "";

  nota = stdin.readLineSync();

  if (nota == null || nota.isEmpty) {
    print("NÃO É POSSÍVEL ADICIONAR NOTA VAZIA!");
    return adicionarNota(notas);
  }

  // ignore: unnecessary_non_null_assertion
  notas.add(nota!);

  return notas;
}

void listarNotas(List<String> notas) {
  for (var i = 0; i < notas.length; i++) {
    print("=> ${notas[i]}");
  }
}

void menu(List<String> notas) {
  var comando = getComando();

  switch (comando) {
    case "1":
      adicionarNota(notas);
      menu(notas);

    case "2":
      listarNotas(notas);
      menu(notas);

    case "3":
      print("...");
      break;
  }
}
