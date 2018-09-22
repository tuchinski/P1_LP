import Foundation

var pontos:Int = 0
var numPalavras:Int = 0

var json = """
{"palavras":[{"letras":["a","c","o","r","r"],"respostas":["caro","carro","aro","orar","cor","corra"]},{"letras":["a","s","o","r","t"],"respostas":["ator","rato","astro","rotas","tosar"]},{"letras":["r","c","r","o","a"],"respostas":["ar","coa","roa","corra","arco"]},{"letras":["m","a","r","o","a"],"respostas":["aro","mar","mora","amora","aroma"]},{"letras":["r","e","p","n","a"],"respostas":["rena","pena","pare","perna","penar"]}]}
"""

let jsonObj = json.data(using: .utf8)!
let aux = try JSONDecoder().decode(Treco.self,from:jsonObj)


print(aux.palavras.count)


//VETORES COM AS LETRAS E RESPOSTAS
let letras = aux.palavras[0].letras
var respostas:[String] = aux.palavras[0].respostas

//Criação do objeto Palavra
var palavra1 = Palavra(letras: letras, respostas: respostas)


print("\n\nBem vindo ao LETROCA\nDigite seu nome:")
let nome = readLine()
print("\nSeja bem vindo \(nome!)")


numPalavras = palavra1.respostas.count
var numPalavrasAcertadas:Int = 0 
var palavrasAcertadas:[String] = []

var palavrasAtual:[String] = palavra1.respostas


//criação do menu
var opcao:String?

printMain()
opcao = readLine()
switch opcao {
    case "1":
            print("val1")
    
    case "2":
            print("val2")

    case ":q":
            print("val:q")
            exit(1)

    default:
            print("opcao invalida")
    
}



while numPalavrasAcertadas != numPalavras {
    print("\n\nEncontre palavras utilizando as seguintes letras: \(letras)")
    let palavraDigitada = readLine()
    // print(palavraDigitada!)
    let indexPalavra = palavrasAtual.index(of:palavraDigitada!)
    if indexPalavra != nil {
        numPalavrasAcertadas += 1
        print("Acertou!! Faltam \(numPalavras-numPalavrasAcertadas) ")
        palavrasAcertadas.append(palavrasAtual.remove(at:indexPalavra!))
    }else {
        print("Tente novamente")
    }
    print ("palavrasAcertadas: \(palavrasAcertadas)")
}



