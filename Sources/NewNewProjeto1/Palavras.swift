struct Treco:Decodable {
    let palavras: [Palavra]
}


struct Palavra:Decodable {
    var letras:[String]
    var respostas:[String]

    init(letras: [String],respostas: [String]){
        self.letras = letras
        self.respostas = respostas
    }
}

func printMain(){
    print("\n1  - Começar novo jogo\n")
    print("2  - Mostrar Highscore\n")
    print(":q - Sair\n")
}

