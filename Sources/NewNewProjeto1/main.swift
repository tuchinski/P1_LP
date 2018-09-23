import Foundation

var pontos:Int = 0
var numPalavras:Int = 0
var palavraAtual:Int = 0 //indica o indice do vetor da palavra atual
let varExit: String = ":q"

var json = """
{"palavras":[{"letras":["a","c","o","r","r"],"respostas":["caro","carro","aro","orar","cor","corra"]},{"letras":["a","s","o","r","t"],"respostas":["ator","rato","astro","rotas","tosar"]},{"letras":["r","c","r","o","a"],"respostas":["ar","coa","roa","corra","arco"]},{"letras":["m","a","r","o","a"],"respostas":["aro","mar","mora","amora","aroma"]},{"letras":["r","e","p","n","a"],"respostas":["rena","pena","pare","perna","penar"]}]}
"""

let jsonObj = json.data(using: .utf8)!
let vetorPalavras = try JSONDecoder().decode(Treco.self,from:jsonObj)


let totalPalavras = vetorPalavras.palavras.count



startGame()

//criação do menu
var opcao:String?

while opcao != varExit{
    system("clear")
    print ("LETROCA")
    printMain()
    opcao = readLine()
    switch opcao {
        case "1":
                game(objPalavras:vetorPalavras)
        
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




