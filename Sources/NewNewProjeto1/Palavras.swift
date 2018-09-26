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

struct PlayerJSON: Decodable {
    let vetPlayer:[Player]

    // func ordena(){
    //     var menor:Int = 0
    //     var vet = self.vetPlayer

    //     for i in 0...vet.count - 1{
    //         // print (i)
    //         for j in i...vet.count - 1{
    //             menor = i
    //             if(vet[j].pontuacaoTotal > vet[i].pontuacaoTotal){
    //                 menor = j
    //             }
    //             print("i:\(i)")

    //             print("jota:\(j)")
    //             print ("menor:\(menor)")
    //             sleep(1)
    //         }
    //         print("aeeeeeeeee\(vet[menor])")
    //         sleep(1)
    //         var aux = vet[i]
    //         vet[i] = vet[menor]
    //         vet[menor] = aux
    //     }
    //     print(vet)

    // }
}