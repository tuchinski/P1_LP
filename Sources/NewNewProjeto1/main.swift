// import SwiftyJSON

var pontos:Int = 0
var numPalavras:Int = 0


//VETORES COM AS LETRAS E RESPOSTAS
let letras = ["A","C","O","R","R"]
var palavras:[String] = ["caro","carro","aro","orar","cor"] 

//Criação do objeto Palavra
var palavra1 = Palavra(letras: letras, respostas: palavras)


print("\n\nBem vindo ao LETROCA\nDigite seu nome:")
let nome = readLine()
print("\nSeja bem vindo \(nome!)")


numPalavras = palavra1.respostas.count
var numPalavrasAcertadas:Int = 0 
var palavrasAcertadas:[String] = []

var palavrasAtual:[String] = palavra1.respostas

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



