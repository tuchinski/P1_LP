import Foundation

func printMain(){
    print("\n1  - Começar novo jogo\n")
    print("2  - Mostrar Highscore\n")
    print(":q - Sair\n")
}

func startGame() -> String{
    system("clear")
    print("Bem vindo ao LETROCA\nDigite seu nome:")
    let nome = readLine()
    print("\nSeja bem vindo: \(nome!)")
    return nome!
}

func game(objPalavras:Treco) -> Int{
    var pontos:Int = 0
    var qtdeErros:Int = 5
    
    let qtdePalavras = objPalavras.palavras.count
    let vetPalavras: [Palavra] = objPalavras.palavras
    var palavraAtual:Int = 0
    while(palavraAtual != qtdePalavras){
        let letras = vetPalavras[palavraAtual].letras
        var respostas = vetPalavras[palavraAtual].respostas
        let numRespostas = vetPalavras[palavraAtual].respostas.count
        var respostasAcertadas:[String] = []
        

        while (respostasAcertadas.count != numRespostas) && (qtdeErros != 0) {
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
                    pontos += 1
                    // system("mpg123 Sources/music/correct.mp3")
                    // system("pwd")
                    sleep(1)
                }
            }else{
                qtdeErros -= 1
                if qtdeErros != 0 {
                    print("Tente novamente\nVocê pode errar \(qtdeErros) vezes")
                }else{
                    return pontos
                }
                sleep(1)
            }
        }
        palavraAtual += 1
        print(qtdeErros)
        
        if(palavraAtual != qtdePalavras){
            print("VOCÊ DESCOBRIU TODAS AS PALAVRAS\nPRÓXIMO NÍVEL...")
        }
        sleep(3)
    }
    return pontos
}

func getRequest(options:Int) -> Data? {
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfiguration)
    var meuDeus: Data?

    var urls:[String] = []
    if(options == 1){
        urls.append("http://localhost:8080/1")
    }else if(options == 2){
        urls.append("http://localhost:8080/2")
    }
    print(urls)

        // let urls = ["http://localhost:8080/2"]

    let group = DispatchGroup()
        print("staring sync")
        urls.forEach { url in
            group.enter()
            session.dataTask(with: URL(string: url)!, completionHandler: {
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

func postRequest(options:Int) -> Data? {
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfiguration)
    var meuDeus: Data?


    var urls:[String] = []
    if(options == 1){
        urls.append("http://localhost:8080/1dsadsa")
    }else if(options == 2){
        urls.append("http://localhost:8080/2")
    }
    
    var request = URLRequest(url:URL(string: urls[0])!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // print (request)
    print(urls)

        // let urls = ["http://localhost:8080/2"]

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