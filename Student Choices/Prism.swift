//
//  Prism.swift
//  Student Choices
//
//  Created by Felipe Alberto on 06/03/25.
//

import Foundation
import Prism

func callPrism(texto : String, cor: Color, corTexto: Color ) -> Prism{
    let text = Prism(spacing: .newlines) {
        Bold{
            BackgroundColor(cor){
                ForegroundColor(corTexto, texto)
                
            }
        }
        
    }
    
return text
}
