import Foundation

var pontos:Int = 0
var numPalavras:Int = 0
// var palavraAtual:Int = 0 //indica o indice do vetor da palavra atual
let varExit: String = ":q"

// var json = """
// {"palavras":[{"letras":["a","c","o","r","r"],"respostas":["caro","carro","aro","orar","cor","corra"]},{"letras":["a","s","o","r","t"],"respostas":["ator","rato","astro","rotas","tosar"]},{"letras":["r","c","r","o","a"],"respostas":["ar","coa","roa","corra","arco"]},{"letras":["m","a","r","o","a"],"respostas":["aro","mar","mora","amora","aroma"]},{"letras":["r","e","p","n","a"],"respostas":["rena","pena","pare","perna","penar"]}]}
// """

//le o JSON do arquivo local
// // var file = FileHandle(forReadingAtPath: "/home/cogeti/Documentos/LP/NewNewProjeto1/Sources/NewNewProjeto1/palavrasteste.json")
// var file = FileHandle(forReadingAtPath: "/home/tuchinski/Documentos/UTFPR/LP/project1/P1_LP/Sources/NewNewProjeto1/palavrasteste.json")
// let json = file!.readDataToEndOfFile()
// let vetorPalavras = try JSONDecoder().decode(Treco.self, from:json)

// print (json)

//requisita o JSON para o servidor
let json = getRequest(options:1)
let vetorPalavras = try JSONDecoder().decode(Treco.self,from:json!)
// print (String(data: json!, encoding: .utf8)!)

// let jsonObj = json.data(using: .utf8)!
// let vetorPalavras = try JSONDecoder().decode(Treco.self,from:jsonObj)



let totalPalavras = vetorPalavras.palavras.count



var pontosJogador: Int = 0 //qtde de pontos do jogador

let playerName = startGame() //retorna o nome do jogador
var jogador: Player? //declara a variavel Player que será enviado para o BD
//criação do menu
var opcao:String?

while opcao != varExit{
    system("clear") //limpa a tela
    print ("\tLETROCA")
    printMain()//imprime o menu na tela
    opcao = readLine()
    switch opcao {
        case "1":
                //QUANDO O JOGO COMEÇA

                pontosJogador = game(objPalavras:vetorPalavras) //chama a função que inicia o jogo, quando ela termina retorna a pontuação do jogador
                jogador = Player(nome:playerName, pontuacao: pontosJogador) //cria o Player que será enviado para o BD
                let jsonPlayer = try JSONEncoder().encode(jogador!)//transforma esse player pra JSON
                let jsonPlayerStr = String(data:jsonPlayer, encoding:.utf8)!
                print (jsonPlayerStr)
                postRequest(options:1, stringDados: jsonPlayerStr)//envia Player para o servidor
                // print(String(data:jsonPlayer, encoding:.utf8)!)
                sleep(1)
        
        case "2":                
                print("HIGHSCORE!")
                let dados = getRequest(options:2) // pega o highscore do servidor options = 1 -> pega as palavras; options = 2 -> pega o highscore 
                system("clear")
                let strHighScore = String(data:dados!, encoding: .utf8)! //transforma os dados do tipo Data para String
                
                //prefixo do JSON

                let prefixo = """
                {"vetPlayer":[
                """

                //sufixo do JSON

                let posfix = """
                ]}
                """

                //junta os dados com prefixo e sufixo
                var strHighScore2 = prefixo + strHighScore + posfix

                //transforma os dados em um vetor de Player
                let jason = try JSONDecoder().decode(PlayerJSON.self, from: strHighScore2.data(using: .utf8)!)
                var vetor = jason.vetPlayer
                vetor.sort{$0.pontuacaoTotal > $1.pontuacaoTotal}
                print("\t\tHIGHSCORE")                
                //printa cada Player
                vetor.forEach{jogadorSalvo in
                        print("-------------------------------------")
                        print("Nome:\(jogadorSalvo.nome)\nPontuação:\(jogadorSalvo.pontuacaoTotal)")
                }
                print("-------------------------------------")

                print("PRESSIONE QUALQUER TECLA PARA SAIR!")
                let sair:String?
                sair = readLine()

        case varExit:
                // print("val:q")
                exit(1)

        default:
                print("Opção inválida!!")
                system("sleep 1")
        
    }
}




