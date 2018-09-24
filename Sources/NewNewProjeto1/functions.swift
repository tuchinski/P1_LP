import Foundation

func printMain(){
    print("\n1  - Começar novo jogo\n")
    print("2  - Mostrar Highscore\n")
    print(":q - Sair\n")
}

func startGame(){
    system("clear")
    print("Bem vindo ao LETROCA\nDigite seu nome:")
    let nome = readLine()
    print("\nSeja bem vindo: \(nome!)")
}

func game(objPalavras:Treco){
    let qtdePalavras = objPalavras.palavras.count
    let vetPalavras: [Palavra] = objPalavras.palavras
    var palavraAtual:Int = 0
    while(palavraAtual != qtdePalavras){
        let letras = vetPalavras[palavraAtual].letras
        var respostas = vetPalavras[palavraAtual].respostas
        let numRespostas = vetPalavras[palavraAtual].respostas.count
        var respostasAcertadas:[String] = []
        

        while respostasAcertadas.count != numRespostas {
            system("clear")
            print("\n\tNivel \(palavraAtual + 1) ")
            print("\nPalavras Acertadas: \(respostasAcertadas)")
            print("\n\nEncontre palavras utilizando as seguintes letras: \(letras)")
            let algumaCoisa = readLine()
            let palavraDigitada = algumaCoisa?.lowercased()
            if(palavraDigitada == varExit){
                exit(1)
            }
            let indexPalavraDigitada = respostas.index(of:palavraDigitada!)
            if indexPalavraDigitada != nil{
                respostasAcertadas.append(respostas.remove(at:indexPalavraDigitada!))
                if(respostas.count != 0){
                    print("Acertou!! Faltam \(respostas.count) palavras")
                    sleep(1)
                }
            }else{
                print("Tente novamente")
                sleep(1)
            }
        }
        palavraAtual += 1
        
        if(palavraAtual != qtdePalavras){
            print("VOCÊ DESCOBRIU TODAS AS PALAVRAS\nPRÓXIMO NÍVEL...")
        }
        sleep(3)
    }
}
