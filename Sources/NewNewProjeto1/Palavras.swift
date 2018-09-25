import Foundation

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

struct Player: Codable {
    let nome:String
    let pontuacaoTotal:Int

    init(nome:String, pontuacao:Int){
        self.nome = nome
        self.pontuacaoTotal = pontuacao
    }
}