import Foundation

var pontos:Int = 0
var numPalavras:Int = 0
// var palavraAtual:Int = 0 //indica o indice do vetor da palavra atual
let varExit: String = ":q"

// var json = """
// {"palavras":[{"letras":["a","c","o","r","r"],"respostas":["caro","carro","aro","orar","cor","corra"]},{"letras":["a","s","o","r","t"],"respostas":["ator","rato","astro","rotas","tosar"]},{"letras":["r","c","r","o","a"],"respostas":["ar","coa","roa","corra","arco"]},{"letras":["m","a","r","o","a"],"respostas":["aro","mar","mora","amora","aroma"]},{"letras":["r","e","p","n","a"],"respostas":["rena","pena","pare","perna","penar"]}]}
// """

//le o JSON do arquivo local
// var file = FileHandle(forReadingAtPath: "/home/cogeti/Documentos/LP/NewNewProjeto1/Sources/NewNewProjeto1/palavrasteste.json")
// var file = FileHandle(forReadingAtPath: "/home/tuchinski/Documentos/UTFPR/LP/project1/P1_LP/Sources/NewNewProjeto1/palavrasteste.json")
// let json = file!.readDataToEndOfFile()

//requisita o JSON para o servidor
let json = getRequest(options:1)
// print (String(data: json!, encoding: .utf8)!)

// let jsonObj = json.data(using: .utf8)!
// let vetorPalavras = try JSONDecoder().decode(Treco.self,from:jsonObj)



let vetorPalavras = try JSONDecoder().decode(Treco.self, from:json!)

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
                let jsonPlayerStr = String(data:jsonPlayer, encoding:.utf8)!
                print (jsonPlayerStr)
                postRequest(options:1, stringDados: jsonPlayerStr)
                // print(String(data:jsonPlayer, encoding:.utf8)!)
                system("sleep 5")

        
        case "2":
                print("HIGHSCORE!")
                let dados = getRequest(options:2)
                system("clear")
                let strHighScore = String(data:dados!, encoding: .utf8)!
                var strHighScore2 = "[" + strHighScore + "]"
                print(strHighScore2)

                let jason = try JSONDecoder().decode([Player].self, from: strHighScore.data(using: .utf8)!)
                // print (jason)
                system("sleep 5")

        case varExit:
                print("val:q")
                exit(1)

        default:
                print("opcao invalida")
        
    }
}




