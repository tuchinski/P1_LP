import Foundation

func printMain(){
   print("\t--------------------------------------------------")
    print("\t\t1  - Começar novo jogo\n")
    print("\t\t2  - Mostrar Highscore\n")
    print("\t\t:v  - Voltar para o menu principal\n")    
    print("\t\t:q - Sair\n")
   print("\t--------------------------------------------------")
    
}

func startGame() -> String{
    system("clear")
    print("\t\t\tBem vindo ao")
    print("\n\t██╗     ███████╗████████╗██████╗  ██████╗  ██████╗ █████╗ ")
        print("\t██║     ██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██╔════╝██╔══██╗")
        print("\t██║     █████╗     ██║   ██████╔╝██║   ██║██║     ███████║")
        print("\t██║     ██╔══╝     ██║   ██╔══██╗██║   ██║██║     ██╔══██║")
        print("\t███████╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╗██║  ██║")
        print("\t╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝\n")

    system("mpg123 Sources/music/open.mp3 2> /dev/null")
    print("Digite seu nome:")
    let nome = readLine()
    print("\nSeja bem vindo: \(nome!)")
    return nome!
}


func game(objPalavras:Treco) -> Int{
    var pontos:Int = 0 //pontos que o user fez
    var qtdeErros:Int = 3 //qtde de vezes que pode errar
    
    let qtdePalavras = objPalavras.palavras.count //quantas palavras temos no total
    let vetPalavras: [Palavra] = objPalavras.palavras //armazena as palavras num vetor de Palavras
    var palavraAtual:Int = 0 //indice do vetor da palavra atual
    while(palavraAtual != qtdePalavras){ //enquanto nao acabar as palavras
        let letras = vetPalavras[palavraAtual].letras //armazena as letras num vetor
        var respostas = vetPalavras[palavraAtual].respostas //armazena as respostas num vetor
        let numRespostas = vetPalavras[palavraAtual].respostas.count //armazena a qtde de respostas certas
        var respostasAcertadas:[String] = [] //armazena as respostas que o user acertou 
        

        while (respostasAcertadas.count < numRespostas) && (qtdeErros != 0) {  //enquanto tiver palavras para ser acertada e erros 
            system("clear")
            print("\n\tNivel \(palavraAtual + 1) ")
            print("\nPalavras Acertadas: \(respostasAcertadas)")
            print("\n\nEncontre palavras utilizando as seguintes letras: \(letras)")
            let algumaCoisa = readLine() 
            let palavraDigitada = algumaCoisa?.lowercased() //transforma o que o usuário digitou para minúsculo
            if(palavraDigitada == varExit){
                exit(1)
            }else if(palavraDigitada == varReturn){
                return -1
            }
            let indexPalavraDigitada = respostas.index(of:palavraDigitada!) //busca a palavra digitada no vetor de respostas
                                                                            //caso encontre, retorna o índice, senão retorna nil
            if indexPalavraDigitada != nil{ //caso o usuário digite uma palavra correta
                respostasAcertadas.append(respostas.remove(at:indexPalavraDigitada!)) //adiciona a palavra no vetor de respostas corretas
                                                                                      //e retira do vetor de respostas
                if(respostas.count != 0){ //caso ainda tenha respostas pra ser acertadas
                    print("Acertou!! Faltam \(respostas.count) palavras") // mostra quantas respostas ainda restam
                    pontos += 1 
                    system("mpg123 Sources/music/correct.mp3 2> /dev/null") //toca um som
                    // sleep(1)
                }
            }else{ //caso erre
                qtdeErros -= 1 
                if qtdeErros != 0 {
                    print("Tente novamente\nVocê pode errar \(qtdeErros) vezes") // mostra quantas vezes o usuário pode errar
                    system("mpg123 Sources/music/wrong_5.mp3 2> /dev/null") //toca um som
                }else{
                    print("\t\tVOCÊ PERDEU!!")
                    system("mpg123 Sources/music/sadtrombone.swf.mp3 2> /dev/null") //toca um som
                    return pontos
                }
                 sleep(1)
            }
        }
        palavraAtual += 1 //quando termina, vai pra próxima palavra
        
        if(palavraAtual != qtdePalavras){
            print("VOCÊ DESCOBRIU TODAS AS PALAVRAS\nPRÓXIMO NÍVEL...")
            system("mpg123 Sources/music/final-fantasy-v-music-victory-fanfare_2.mp3 2> /dev/null")
        }
        // sleep(3)
    }
    system("mpg123 Sources/music/hallelujahshort.swf.mp3 2> /dev/null") //toca um som
    return pontos
}

func getRequest(options:Int) -> Data? {
    //configuração da session
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfiguration)

    var meuDeus: Data? //vai receber os dados do server

    var urls:[String] = []
    if(options == 1){
        urls.append("http://localhost:8080/getJson") //pega o JSON
    }else if(options == 2){
        urls.append("http://localhost:8080/getHighScore")//pega o highscore
    }
    // print(urls)

    //faz a requisição pro servidor
    let group = DispatchGroup()
        print("staring sync")
        urls.forEach { url in
            group.enter()
            session.dataTask(with: URL(string: url)!, completionHandler: {
                (data, response, error) in
                meuDeus = data
                group.leave()
            }).resume()
        }

    print("ending sync")
    group.wait()
    print("FINAL")
    return meuDeus
}  

func postRequest(options:Int, stringDados: String) -> Data? {
    //configuração da session
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfiguration)
    var meuDeus: Data?


    var urls:[String] = []
    if(options == 1){
        urls.append("http://localhost:8080/postHighScore")
    }else if(options == 2){
        urls.append("http://localhost:8080/")
    }
    // var jsonPlayer:Data?
    // let jogador = Player(nome:"playerName", pontuacao: 8000)
    // do {
    //     jsonPlayer = try JSONEncoder().encode(jogador)
    // } catch  {
    //     print("ERR")
    // }

    //cria uma request POST
    var request = URLRequest(url:URL(string: urls[0])!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = stringDados.data(using: .utf8)

    // print (request)
    // print(urls)

    //faz a requisição pro servidor
    let group = DispatchGroup()
        print("staring sync")
        urls.forEach { url in
            group.enter()
            session.dataTask(with:request, completionHandler: {
                (data, response, error) in
                // let str = String(data: data!, encoding: .utf8)
                // print("Task ran! \(str!)")
                meuDeus = data
                group.leave()
            }).resume()
        }

    print("ending sync")
    group.wait()
    print("FINAL")
    return meuDeus
}  