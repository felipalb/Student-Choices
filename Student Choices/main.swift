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
var Age : Int = 0
var University : String = ""
// declarei variavel vazia para guardar valor de input
// nome, genero, idade, universidade
print("Insira o nome: \n")
if let input = readLine() {
    NameStudent = input
    print("Olá, \(NameStudent)")
}
while !auth {
    
print("Selecione o gênero: \n1. Masculino\n2. Feminino\n3. Outro")

if let input = readLine(), let choice = Int(input) {
    
    switch choice {
    case 1:
        Gender = "Masculino"
        auth = true
    case 2:
        Gender = "Feminino\n"
        auth = true
    case 3:
        Gender = "outro \n"
        auth = true
    default:
        print("opcao invalida")
    }
    
}
    
    else{
        print("teste")
    }
    
}

if let SelectedGen = Gender {
    print("voce é do genero: \(SelectedGen)")
}
// if para ler a linha (readLine), guardando dentro da var nomeada Naluno
// retorna depois olá + nome do aluno "\(variavelNome)"






