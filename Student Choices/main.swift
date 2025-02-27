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
func LifeGain() -> Int {
    //faço valor de Life +1
    Life += 1
    return Life
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

// recepcao nome personagem e validacao
while NameStudent.isEmpty{
// continua executando enquanto o nome for uma string vazia
    print("Insira o nome: \n")
    if let input = readLine(), !input.isEmpty{
            // if para ler a linha (readLine), guardando dentro da var
            // verifica se a entrada não está vazia
            NameStudent = String(input)
            print("Olá, \(NameStudent)")
        }
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
print("Os dados do seu personagem são: \n nome: \(NameStudent);\n Idade: \(Age);\n Genero: \(SelectedGen);\n Universidade: \(University).")
}

Thread.sleep(forTimeInterval: 8)
// pausa execucao por 8s
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
definir qual tipo de aluno quer se tornar e consequentemente quais notas tirar.
Cada decisão pode impactar positivamente ou negativamente no seu foco
(que será sempre atualizado ao final de cada semana).
""")
// """ para multi line string
Thread.sleep(forTimeInterval: 4)
print("  **************\n \n  **************")
print("\(NameStudent) chega na maior impolgação, e se depara com a dificil escolha: \n1. Sair para beber com os calouros \n2. Participar da aula de fisica mega legal \n3. Ver a aula e depois sair para beber")
print("SEU FOCO: \(Life)")

/*func doingchoices (){
    if let input = readLine(), let choice = Int(input){
        switch choice{
        case 1:
            Choices = "Negativo"
        case 2:
            Choices = "Positivo"
        case 3:
            Choices = "Neutro"
        default:
            print("teste2")
        }
    }
}*/


// ouve a entrada, cria "choice" que vai receber um Int (1,2,3)
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
if Choices == "Negativo"{
    Lostlife()
}

// ideias: criar uma func para choices perca e ganho, chama-las direto no switch case poupando processamento.
