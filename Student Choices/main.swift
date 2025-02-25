//
//  main.swift
//  Student Choices
//
//  Created by Aluno 11 on 24/02/25.
//

import Foundation

print ("Bem vindo ao Student Choices!! \nCrie seu personagem!")
var NameStudent : String = ""
var Gender : String? = nil
// declaro como string opcional armazena entrada tipo string e tipo nil
var auth = false
// variavel de autenticacao do loops
var Age : Int = 0
var University : String = ""
// declarei variavel vazia para guardar valor de input
var Life : String = "* * * * *"
// nome, genero, idade, universidade
while NameStudent.isEmpty{
// continua executando enquanto o nome for uma string vazia
    print("Insira o nome: \n")
        if let input = readLine(), !input.isEmpty {
            // if para ler a linha (readLine), guardando dentro da var
            // verifica se a entrada não está vazia
            NameStudent = input
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
            print("opção invalida")
    }
}
    // verifico se o valor da entrada é numero int ou não default
    else {
        print("Insira um valor válido.")
    }
}

// if para mudar de outro para neutro
if Gender == "Outro" {
    Gender = "Neutro"
}


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
    else{print("Valor invalido")}
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
// gender está com ! pois é um valor nil, o swift nao interpreta, para valores assim utilizar if let para verificacao do valor (como foi feito)
// retorna dados
