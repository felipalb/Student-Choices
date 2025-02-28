//
//  main.swift
//  Student Choices
//
//  Created by Felipe Alberto on 24/02/25.
//

import Foundation

print ("Bem vindo ao Student Choices!! \nCrie seu personagem!")
// criacao: nome, genero, idade, universidade
var NameStudent : String = ""
var Gender : String? = nil
// declaro como string opcional armazena entrada tipo string e tipo nil
var auth = false
var auth2 = false
// variavel de autenticacao do loops
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
    print("Você perdeu um ponto de foco, seu foco restante é: \(Life)")
    // retorno Life
}

// definindo funcao para funcionamento ganho de vida
func LifeGain() {
    //faço valor de Life +1
    Life += 1
    print("Você ganhou um ponto de foco, seu foco agora é: \(Life)")
    // retorno Life
}

// -> (retorno) int = tipo de retorno que dara
// como essa funcao nao retorna nada apenas printa não é necessario ->
// criacao de funcao para o final do jogo por morte sem vidas
func EndGame(){
    if Life == 0{
        print("""
            Você falhou!
            Suas escolhas te dão maior chance de não conseguir ser aprovado no semestre.
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
            print("Insira os numerais 1,2 ou 3 referente ao genero desejado.")
    }
}
    // verifico se o valor da entrada é numero int ou não default
    else {
        print("Insira os numerais 1,2 ou 3 referente ao genero desejado.")
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
            University = input
            print("Bem vindo a \(University), \(NameStudent)")
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
// gender está com ! pois é um valor nil, o swift nao interpreta, para valores assim utilizar if let para verificacao do valor (como foi feito)
// retorna dados


Thread.sleep(forTimeInterval: 4)
print("""
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
