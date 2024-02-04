//
//  IngredienteView.swift
//  Cookapp
//
//  Created by Juan Carlos Guzman R on 2/3/24.
//

import SwiftUI

struct IngredienteView: View {
    
    let dummyIngredient = RecipeIngredient(
        id: UUID(),
        quantity: "2",
        normalizedQuantity: "2",
        scale: "unidades",
        name: "dientes de ajo",
        basicIngredient: "ajo",
        notes: "Picar finamente"
    )
    
    var ingrediente: RecipeIngredient
    
        var body: some View {
            HStack {
                //Text(ingrediente.imagen)
                Text("📱")
                    .font(.title) // Aumentar el tamaño del emoji
                    .frame(width: 40, height: 40) // Tamaño para el área del emoji
                    
                Text(ingrediente.name)
                    .font(.caption)
                    .frame(height: 50) // Ajustar la altura para que coincida con el área del emoji

                Spacer() // Asegurar que el texto del nombre se alinee a la izquierda junto al emoji
            }
            .background(.ultraThinMaterial)// Fondo verde para toda la vista horizontal
            .cornerRadius(20) // Esquinas redondeadas para toda la vista horizontal
            //.frame(height: 60) // Ajustar la altura total de la vista horizontal
            //.padding(.horizontal) // Añadir padding horizontal a toda la vista
        }
}

#Preview {
    IngredienteView(ingrediente: RecipeIngredient.dummyData)
}
