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
  print("");
  cabecalho();
  print("");
  var comando = getComando();
  print("");

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

void cabecalho() {
  print(r'''
.______    __        ______     ______   ______       _______   _______    .__   __.   ______   .___________.    ___           _______.
|   _  \  |  |      /  __  \   /      | /  __  \     |       \ |   ____|   |  \ |  |  /  __  \  |           |   /   \         /       |
|  |_)  | |  |     |  |  |  | |  ,----'|  |  |  |    |  .--.  ||  |__      |   \|  | |  |  |  | `---|  |----`  /  ^  \       |   (----`
|   _  <  |  |     |  |  |  | |  |     |  |  |  |    |  |  |  ||   __|     |  . `  | |  |  |  |     |  |      /  /_\  \       \   \    
|  |_)  | |  `----.|  `--'  | |  `----.|  `--'  |    |  '--'  ||  |____    |  |\   | |  `--'  |     |  |     /  _____  \  .----)   |   
|______/  |_______| \______/   \______| \______/     |_______/ |_______|   |__| \__|  \______/      |__|    /__/     \__\ |_______/ 
''');
}
