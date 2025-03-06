//
//  Prism.swift
//  Student Choices
//
//  Created by Felipe Alberto on 06/03/25.
//

import Foundation
import Prism

// criacao de funcao para cores de texto
func callPrism(texto: String, cor: Color, corTexto: Color ) -> Prism{
    // parametros que devo passar ao chamar a funcao
    let text = Prism(spacing: .newlines) {
        Bold{
            BackgroundColor(cor){
                ForegroundColor(corTexto, texto)
                
            }
        }
        
    }
    
return text
}
