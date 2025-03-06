//
//  main.swift
//  Student Choices
//
//  Created by Felipe Alberto on 24/02/25.
//

import Foundation
import Prism

print(callPrism(texto:"Bem vindo ao Student Choices!! \nCrie seu personagem!", cor:.blue, corTexto:.white))

// criacao: nome, genero, idade, universidade
var NameStudent : String = ""
var Gender : String? = nil
// declaro como string opcional armazena entrada tipo string e tipo nil
var auth = false
var auth2 = false
var authQuestion1 = false
var authquestion = false
var authquestion2 = false
// variavel de autenticacao do loops
var Answer2 : String? = nil
var Answer1 : String? = nil
var Answer : String? = nil
var Age : Int = 0
var University : String = ""
// declarei variavel para vida iniciando em 5
var Life : Int = 5
var Choices : String = ""

// definindo funcao para funcionamento perca de vida
func Lostlife(){
// nao tem -> pois nao necessariamente quero que ele retorne um int ou string, apenas um print
    //faço valor de Life -1
    Life -= 1
    print(callPrism(texto:"Você perdeu um ponto de foco, seu foco restante é: \(Life)", cor:.red, corTexto:.white))
    // chama a funcao callPrism para definir cores
    // retorno Life
}

// definindo funcao para funcionamento ganho de vida
func LifeGain() {
    //faço valor de Life +1
    Life += 1
    print(callPrism(texto: "Você ganhou um ponto de foco, seu foco agora é: \(Life)", cor:.green, corTexto:.black))
    // chama a funcao callPrism para definir cores
    // retorno Life
}

// -> (retorno) int = tipo de retorno que dara
// como essa funcao nao retorna nada apenas printa não é necessario ->
// criacao de funcao para o final do jogo por morte sem vidas
func EndGame(){
    if Life == 0{
        print("""
                   
            ---------------------------------------------------

            ❌ Você falhou!
            Suas escolhas fazem com que reprove no semestre. 😢

            ---------------------------------------------------
                   
            """)
    }
}

// funcao que executa a verificacao de suas escolhas, e a partir disso verifica se ganha ou perde "vidas"
func VerifyChoices (){
    if Choices == "Negativo"{
        Lostlife()
    }
    else if Life < 5, Choices == "Positivo" {
        LifeGain()
    }
    // verifica vidas, quando zera chama EndGame
    else if Life == 0{
        EndGame()
    }
}

// definindo uma funcao de algo repetitivo que faz a classificacao e validacao dos dados coletados a partir das respostas
func doingchoices (){
    // sempre que iniciar a func auth2 = false, para existir a validacao
    auth2 = false
    while !auth2{
        if let input = readLine(), let choice = Int(input){
            switch choice{
            case 1:
                Choices = "Negativo"
                auth2 = true
            case 2:
                Choices = "Positivo"
                auth2 = true
            case 3:
                Choices = "Neutro"
                auth2 = true
            default:
                print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
            }
        }else{
            print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
        }
}
}

// funcao para animacao de delay ao printar frase
func typewriter(_ text: String, delay: UInt32 = 110_000){
    // defino a funcao para receber String, defino delay de 85 milisegundos
    for char in text{
        print(char, terminator: "")
        // exibicao do caracter atual em char que recebe o text
        fflush(stdout)
        // forca limpeza de buffer na saida
        usleep(delay)
    }
    print()
}

// recepcao nome personagem e validacao
while NameStudent.isEmpty{
// continua executando enquanto o nome for uma string vazia
    print("Insira o nome: \n")
    if let input = readLine(), !input.isEmpty{
            // if para ler a linha (readLine), guardando dentro da var
            // verifica se a entrada não está vazia
        // cria containNumbers para pegar a entrada e analisar se tem algum numero
        let ContainNumbers = input.contains{$0.isNumber}
        // se nao tiver numeros salva e printa ola nome
        if !ContainNumbers{
            NameStudent = input
            print("Olá, \(NameStudent)")
        }else{
            // se tiver numeros printa erro
            print("O nome não pode conter numeros. informe um nome válido")
        }

        }
    // se nao tiver nada printa para informar
    else{
        print("informe um nome para seu personagem")
    }
}
while !auth {
// garante que o loop continue até que uma escolha válida seja feita
    
print("Selecione o gênero: \n1. Masculino\n2. Feminino\n3. Outro")

if let input = readLine(), let choice = Int(input) {
// crio variavel provisoria choice, para comparar choice com os casos
    switch choice {
        case 1:
            Gender = "Masculino"
            //armazeno a escolha string na gender
            auth = true
            //autentico como true a var auth para validar escolha
        case 2:
            Gender = "Feminino"
            auth = true
        case 3:
            Gender = "Outro"
            auth = true
        default:
            // se escolha não for 1,2,3 executa aqui
            print("Insira os numerais 1,2 ou 3 referente ao gênero desejado.")
    }
}
    // verifico se o valor da entrada é numero int ou não default
    else {
        print("Insira os numerais 1,2 ou 3 referente ao gênero desejado.")
    }
}

// if para mudar de outro para neutro
if Gender == "Outro" {
    Gender = "Neutro"
}

var pronums : String = ""
if let gen = Gender {
    if gen == "Neutro"{
        pronums = "e"
    }
    else if gen == "Masculino"{
        pronums = "o"
    }
    else if gen == "Feminino"{
        pronums = "a"
    }
}
// if para verificacao e definicao dos pronomes a partir do genero do personagem

while Age <= 0 {
    print ("Qual é a sua Idade?")
    if let input = readLine(), !input.isEmpty, let idade = Int(input){
        // le o input, verifica se não é nulo, cria a variavel temp. idade int que recebe o input
        if idade < 16 {
        // faz validacao da idade
            print("tem certeza de que você é um universitário?!")
        }else{
            Age = idade
        // adiciona para a variavel, o valor da variavel temp.
        }
    }
    else{print("Insira um valor de forma numérica para a idade d\(pronums) \(NameStudent).")}
}

while University.isEmpty{
// continua executando enquanto o nome for uma string vazia
    print("Insira o nome da universidade: \n")
        if let input = readLine(), !input.isEmpty {
            // if para ler a linha (readLine)
            // verifica se a entrada não está vazia
            // cria ContainNumbers que ve se a entrada recebe algum numero
            let ContainNumbers = input.contains{$0.isNumber}
            // se nao tiver numeros continua codigo
            if !ContainNumbers{
            University = input
            print("Bem vindo a \(University), \(NameStudent)")
            }else{
                // se tiver printa erro
                print("O nome da universidade não pode conter números. Informe um valor válido.")
            }
        }
    else{
        print("informe o nome da universidade")
    }
}
if let SelectedGen = Gender {
print("Os dados do seu personagem são: \n Nome: \(NameStudent);\n Idade: \(Age);\n Gênero: \(SelectedGen);\n Universidade: \(University).")
}

Thread.sleep(forTimeInterval: 6)
// pausa execucao por 6s
print("  **************\nRealizando Matricula...\n  **************")
Thread.sleep(forTimeInterval: 4)
// pausa execucao por 5s
print("Matricula Realizada!!\n  **************")
// retorna dados


Thread.sleep(forTimeInterval: 4)
typewriter(
"""
A primeira semana de aula se inicia, e o grande desafio d\(pronums) \(NameStudent) é sobreviver aos trotes.
Daqui pra frente você terá que decidir como será tal tragetória,
definir qual tipo de alun\(pronums) quer se tornar e consequentemente quais notas tirar.
Cada decisão pode impactar positivamente ou negativamente no seu foco
(que será sempre atualizado ao tomar uma decisão).
""")

// """ para multi line string
Thread.sleep(forTimeInterval: 4)
print("  **************\n \n  **************")
print("\(NameStudent) chega na maior impolgação, e se depara com a dificil escolha: \n1. Sair para beber com os calouros \n2. Participar da aula de fisica mega legal \n3. Ver a aula e depois sair para beber")
print("SEU FOCO: \(Life)")

auth2 = false
// ouve a entrada, cria "choice" que vai receber um Int (1,2,3)
// enquanto auth2 nao for true
while !auth2{
    if let input = readLine(), let choice = Int(input){
        switch choice{
            case 1:
                Choices = "Negativo"
                auth2 = true
            case 2:
                Choices = "Positivo"
                auth2 = true
            case 3:
                Choices = "Neutro"
                auth2 = true
        default:
            print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
            
        }
    }else{
        print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
    }

}
VerifyChoices()

Thread.sleep(forTimeInterval: 4)
print("""
\(NameStudent) durante a semana faz muit\(pronums)s amig\(pronums)s,
que te chamam para cada rolê universitario de começo de semestre,
\(NameStudent) decide: \n1. Ir para as festas e curtir o máximo \n2. Ir para a aula, descansar e aproveitar para revisar o conteúdo \n3. Ir para a aula, e tentar fazer novas amizades saindo para barzinho no final do dia
""")
print("SEU FOCO: \(Life)")
doingchoices()
VerifyChoices()
Thread.sleep(forTimeInterval: 4)
print("""
\(NameStudent) está morando nos arredores da \(University),
sendo que foi combinado com que todos os finais de semana iria para casa de seus pais,
porém fica na maior indecisão: \n1. Ir para festas pois a noite é uma criança \n2. Ir para casa dos seus pais, passar o final de semana se alimentando bem \n3. Almoçar com alguns amig\(pronums)s e no final da tarde ir para a casa dos pais
""")
print("SEU FOCO: \(Life)")
doingchoices()
VerifyChoices()

Thread.sleep(forTimeInterval: 2)
print("\n---------------------------------------------------\n")
typewriter("""

A segunda semana começou! Novos desafios e oportunidades surgem no caminho d\(pronums) \(NameStudent). Agora, mais do que nunca, é preciso
equilíbrio entre estudos e vida social.
\(NameStudent) continua sua jornada universitária, e se depara com outra escolha:

1. Iniciar projeto de estudos
2. Ir para a festa da faculdade
3. Estudar exageradamente no fim de semana para poder curtir a festa

""")
print("SEU FOCO: \(Life)")
auth2 = false

auth2 = false
while !auth2{
    if let input = readLine(), let choice = Int(input){
        switch choice{
            case 1:
                Choices = "Positivo"
                print("Resolveu o problema de forma saudável, melhorando o bem-estar emocional d\(pronums) \(NameStudent), ganhou foco.")
                auth2 = true
            case 2:
                Choices = "Negativo"
                print("Ignorou os sentimentos e gerou mais frustração e aumentou o estresse, perdeu foco.")
                auth2 = true
            case 3:
                Choices = "Negativo"
                print("A decisão aliviou \(NameStudent) momentaneamente, mas também gerou arrependimento e perda de conexões importantes, afetando o bem-estar, perdeu foco.")
                auth2 = true
        default:
            print("Opção inválida. Escolha 1, 2 ou 3.")
        }
    } else{
        print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
    }
}

VerifyChoices()

Thread.sleep(forTimeInterval: 2)
print("\n---------------------------------------------------\n")
print("""

\(NameStudent) começa a sentir o peso da rotina acadêmica e percebe que algo não está certo. O cansaço bate forte, a cabeça dói, e a motivação
parece ter sumido. Agora, é preciso tomar uma decisão difícil para lidar com essa fase:

1. Tirar um dia de descanso para recuperar as energias e voltar com tudo
2. Ignorar o cansaço e continuar estudando, afinal, não há tempo a perder
3. Conversar com um amigo ou professor para buscar apoio e conselhos

""")
print("SEU FOCO: \(Life)")

auth2 = false
while !auth2{
    if let input = readLine(), let choice = Int(input){
        switch choice{
            case 1:
                Choices = "Positivo"
                print("Resolveu o problema de forma saudável, melhorando o bem-estar emocional d\(pronums) \(NameStudent), ganhou foco.")
                auth2 = true
            case 2:
                Choices = "Negativo"
                print("Ignorou os sentimentos e gerou mais frustração e aumentou o estresse, perdeu foco.")
                auth2 = true
            case 3:
                Choices = "Positivo"
                print("A decisão aliviou \(NameStudent) momentaneamente, mas também gerou arrependimento e perda de conexões importantes, afetando o bem-estar, perdeu foco.")
                auth2 = true
        default:
            print("Opção inválida. Escolha 1, 2 ou 3.")
        }
    } else{
        print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
    }
}

VerifyChoices()

Thread.sleep(forTimeInterval: 2)
print("\n---------------------------------------------------\n")
print("""

\(NameStudent) está enfrentando dificuldades nos relacionamentos pessoais. Um desentendimento com um amigo próximo ou parceiro(a) começa a afetar
seu foco e a pressão aumenta. Agora, é hora de tomar uma decisão difícil sobre como lidar com a situação:

1. Tentar resolver a situação conversando e buscando uma solução pacífica
2. Ignorar o problema e focar somente nos estudos, esperando que tudo se resolva por si mesmo
3. Terminar a amizade ou relacionamento para focar 100% em seus objetivos acadêmicos

""")
print("SEU FOCO: \(Life)")

auth2 = false
while !auth2{
    if let input = readLine(), let choice = Int(input){
        switch choice{
            case 1:
                Choices = "Positivo"
                print("Resolveu o problema de forma saudável, melhorando o bem-estar emocional d\(pronums) \(NameStudent), ganhou foco.")
                auth2 = true
            case 2:
                Choices = "Neutro"
                print("Ignorou os sentimentos e gerou mais frustração e aumentou o estresse, perdeu foco.")
                auth2 = true
            case 3:
                Choices = "Negativo"
                print("A decisão aliviou \(NameStudent) momentaneamente, mas também gerou arrependimento e perda de conexões importantes, afetando o bem-estar, perdeu foco.")
                auth2 = true
        default:
            print("Opção inválida. Escolha 1, 2 ou 3.")
        }
    } else{
        print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
    }
}

VerifyChoices()

Thread.sleep(forTimeInterval: 2)
print("\n---------------------------------------------------\n")
typewriter("""

Mais uma semana se inicia! Você está aguentando firme, superando cada desafio, e já está ficando expert em equilibrar os estudos com as
adversidades. Vamos lá, \(NameStudent), o caminho não é fácil, mas o sucesso está logo ali. Hora de continuar sua jornada!

""")
print("""

Uma proposta de estágio chegou até você, \(NameStudent)! Esta é a chance de ganhar experiência prática, mas também pode exigir que você se
dedique mais ao trabalho do que aos estudos. Agora, é hora de tomar uma decisão importante:

1. Aceitar a oportunidade de estágio e ganhar experiência prática, mas arriscar menos tempo para os estudos
2. Recusar o estágio para focar integralmente nos estudos e nas notas
3. Pedir um tempo para pensar, tentando equilibrar estágio e estudos de forma sábia

""")
print("SEU FOCO: \(Life)")


auth2 = false
while !auth2{
    if let input = readLine(), let choice = Int(input){
        switch choice{
            case 1:
                Choices = "Neutro"
                print("Resolveu o problema de forma saudável, melhorando o bem-estar emocional d\(pronums) \(NameStudent), ganhou foco.")
                auth2 = true
            case 2:
                Choices = "Positivo"
                print("Ignorou os sentimentos e gerou mais frustração e aumentou o estresse, perdeu foco.")
                auth2 = true
            case 3:
                Choices = "Positivo"
                print("A decisão aliviou \(NameStudent) momentaneamente, mas também gerou arrependimento e perda de conexões importantes, afetando o bem-estar, perdeu foco.")
                auth2 = true
        default:
            print("Opção inválida. Escolha 1, 2 ou 3.")
        }
    } else{
        print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
    }
}

VerifyChoices()

Thread.sleep(forTimeInterval: 2)
print("\n---------------------------------------------------\n")
print("""

Surge uma oportunidade para \(NameStudent): uma competição de programação está acontecendo no campus, com prêmios e reconhecimento. Você precisa
decidir como agir:

1. Participar da competição, tentar vencer e ganhar experiência prática de programação
2. Focar nos estudos, mesmo que isso signifique perder a chance de competir e ganhar prêmios
3. Participar da competição, mas com o objetivo de aprender e se divertir, sem pressão para vencer

""")
print("SEU FOCO: \(Life)")
auth2 = false

auth2 = false
while !auth2{
    if let input = readLine(), let choice = Int(input){
        switch choice{
            case 1:
                Choices = "Positivo"
                print("Resolveu o problema de forma saudável, melhorando o bem-estar emocional d\(pronums) \(NameStudent), ganhou foco.")
                auth2 = true
            case 2:
                Choices = "Neutro"
                print("Ignorou os sentimentos e gerou mais frustração e aumentou o estresse, perdeu foco.")
                auth2 = true
            case 3:
                Choices = "Positivo"
                print("A decisão aliviou \(NameStudent) momentaneamente, mas também gerou arrependimento e perda de conexões importantes, afetando o bem-estar, perdeu foco.")
                auth2 = true
        default:
            print("Opção inválida. Escolha 1, 2 ou 3.")
        }
    } else{
        print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
    }
}

VerifyChoices()

print("\n---------------------------------------------------\n")
Thread.sleep(forTimeInterval: 2)

print("""
Atenção, \(NameStudent)!
A p2 está chegando! Prepare-se bem, revise o conteúdo e mostre tudo o que aprendeu. O sucesso está ao seu alcance!
Boa sorte! 🚀
""")

print("\n---------------------------------------------------\n")
Thread.sleep(forTimeInterval: 2)
print("""

\(NameStudent) se encontra diante da tão esperada p2. Essa prova pode determinar seu desempenho no semestre inteiro.
O problema é que \(NameStudent) se sente um pouco inseguro, e agora precisa decidir como agir:

1. Estudar intensamente durante a noite toda para garantir que esteja preparado, mesmo que isso afete o sono
2. Revisar o conteúdo e descansar, confiando no seu conhecimento e no tempo de estudo já dedicado
3. Fazer uma pausa e sair para dar uma caminhada, tentando aliviar a ansiedade antes da prova

""")
print("SEU FOCO: \(Life)")


auth2 = false
while !auth2{
    if let input = readLine(), let choice = Int(input){
        switch choice{
            case 1:
                Choices = "Negativo"
                print("Resolveu o problema de forma saudável, melhorando o bem-estar emocional d\(pronums) \(NameStudent), ganhou foco.")
                auth2 = true
            case 2:
                Choices = "Positivo"
                print("Ignorou os sentimentos e gerou mais frustração e aumentou o estresse, perdeu foco.")
                auth2 = true
            case 3:
                Choices = "Neutro"
                print("A decisão aliviou \(NameStudent) momentaneamente, mas também gerou arrependimento e perda de conexões importantes, afetando o bem-estar, perdeu foco.")
                auth2 = true
        default:
            print("Opção inválida. Escolha 1, 2 ou 3.")
        }
    } else{
        print("Insira os numerais 1,2 ou 3 referente a alternativa desejada")
    }
}

VerifyChoices()
print("\n---------------------------------------------------\n")
Thread.sleep(forTimeInterval: 2)

while !authquestion {
authquestion = false
typewriter("""

A última semana do semestre está começando, e \(NameStudent) percebe que ainda não teve muitas interações com outras pessoas da sala. O tempo
para criar laços está se esgotando. Nesse momento, ele:

1. Prefere ficar sozinho e seguir sua rotina como de costume
2. Decide vencer a timidez e puxar assunto com alguém

""")
print("SEU FOCO: \(Life)")
    
if let input = readLine(), let x = Int(input){
      switch x {
          case 1:
            Answer = "ficar sozinho "   // boa
            authquestion = true
          case 2:
            Answer = "interagir"  // ruim
            authquestion = true
     default:
        print("Valor inválido,digite 1 ou 2 para responder")
      }
} else{
    print("Valor inválido,digite 1 ou 2 para responder")
}
VerifyChoices()

print("\n---------------------------------------------------\n")
Thread.sleep(forTimeInterval: 2)
while !authQuestion1 {
print("""

Tudo ficou calmo por um tempo mas a p3 está cada vez mais perto então chegou a hora de tomar sua decisão
Essa matéria além de entediante é uma das mais complicadas do seu semestre
Pense com extremo cuidado como você deve seguir. Sua p3 será na semana seguinte, \(NameStudent) escolhe:

1. Revisar a matéria com calma e descansar
2. Deixar pra revisar de última hora

""")
print("SEU FOCO: \(Life)")
if let input = readLine(), let x = Int(input){
  switch x {
      case 1:
        Answer1 = "estudar" // boa
        authQuestion1 = true
        
        
      case 2:
        Answer1 = "sair" // caso a resposta seja sair continua pra proxima pergunta
        authQuestion1 = true
        
  default:
    print("Valor inválido,digite 1 ou 2 para responder")
  }
 }
}
VerifyChoices()


if  Answer1 == "estudar"{    // final bom
    print("""

---------------------------------------------------

🎉 PARABÉNS!
Suas escolhas foram bem pensadas e \(NameStudent) conseguirá ter um próximo semestre tranquilo, além de ter tirado boas notas em
suas avaliações. 😃

---------------------------------------------------

""")
    authquestion2 = true
}
if Answer2 == "sair"{
    authquestion2 = true
    }

Thread.sleep(forTimeInterval: 2)
// pergunta pra caso a resposta seja sair
while !authquestion2 {
    print("""
      
Seu professor demorou algum tempo até divulgar as notas da p3 e as médias, \(NameStudent) acabou ficando de exame mas já tinha programado uma
viagem bem nessa data, então você:

1. Mantem o plano da viagem mesmo que reprove na disciplina
2. Ficar e fazer o exame
      
""")
print("SEU FOCO: \(Life)")
if let input = readLine(), let y = Int(input){
  switch y {
      case 1:
        Answer2 = "sair"    // final ruim
        authquestion2 = true
      case 2:
        Answer2 = "estudar" // printa  intermediario
        authquestion2 = true
  default:
    print("Valor inválido, digite 1 ou 2 para responder")
    }
VerifyChoices()

if Answer2 == "sair"{
print("""
       
---------------------------------------------------

❌ Você falhou!
Suas escolhas fazem com que reprove no semestre. 😢

---------------------------------------------------
       
""")

  }
if Answer2 == "estudar"{
        print("""

---------------------------------------------------

🎉 PARABÉNS !!!
Você conseguiu sobreviver ao seu primeiro semestre!
Mas tenha escolhas melhores no proximo semestre. 😊

---------------------------------------------------

""")
    }
  }
 }
}
