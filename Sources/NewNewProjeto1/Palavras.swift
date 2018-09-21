struct Treco {
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