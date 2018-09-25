import Foundation

var pontos:Int = 0
var numPalavras:Int = 0
var palavraAtual:Int = 0 //indica o indice do vetor da palavra atual
let varExit: String = ":q"

// var json = """
// {"palavras":[{"letras":["a","c","o","r","r"],"respostas":["caro","carro","aro","orar","cor","corra"]},{"letras":["a","s","o","r","t"],"respostas":["ator","rato","astro","rotas","tosar"]},{"letras":["r","c","r","o","a"],"respostas":["ar","coa","roa","corra","arco"]},{"letras":["m","a","r","o","a"],"respostas":["aro","mar","mora","amora","aroma"]},{"letras":["r","e","p","n","a"],"respostas":["rena","pena","pare","perna","penar"]}]}
// """

//le o JSON do arquivo local
// var file = FileHandle(forReadingAtPath: "/home/cogeti/Documentos/LP/NewNewProjeto1/Sources/NewNewProjeto1/palavrasteste.json")
var file = FileHandle(forReadingAtPath: "/home/tuchinski/Documentos/UTFPR/LP/project1/P1_LP/Sources/NewNewProjeto1/palavrasteste.json")
let json = file!.readDataToEndOfFile()

//requisita o JSON para o servidor
// let json = postRequest(options:1)

// let jsonObj = json.data(using: .utf8)!
// let vetorPalavras = try JSONDecoder().decode(Treco.self,from:jsonObj)

let vetorPalavras = try JSONDecoder().decode(Treco.self, from:json)

let totalPalavras = vetorPalavras.palavras.count



var pontosJogador: Int = 0

let playerName = startGame() //retorna o nome do jogador
var jogador: Player?
//criação do menu
var opcao:String?

while opcao != varExit{
    system("clear")
    print ("LETROCA")
                if jogador != nil{
                        print (jogador!)
                }
    printMain()
    opcao = readLine()
    switch opcao {
        case "1":
                pontosJogador = game(objPalavras:vetorPalavras)
                jogador = Player(nome:playerName, pontuacao: pontosJogador)
                let jsonPlayer = try JSONEncoder().encode(jogador!)
                print(String(data:jsonPlayer, encoding:.utf8)!)
                system("sleep 5")

        
        case "2":
                print("HIGHSCORE!")
                system("sleep 1")

        case varExit:
                print("val:q")
                exit(1)

        default:
                print("opcao invalida")
        
    }
}




