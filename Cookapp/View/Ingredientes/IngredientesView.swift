//
//  IngredientesView.swift
//  Cookapp
//
//  Created by Juan Carlos Guzman R on 2/3/24.
//

import SwiftUI

struct IngredientesView: View {
    @State private var ingredientes: [RecipeIngredient] = Recipe.dummyData.ingredients
    
    
    @State private var filtroSeleccionado: String = "Todos"

    private var ingredientesFiltrados: [RecipeIngredient] {
        if filtroSeleccionado == "Todos" {
            return ingredientes
        } else {
            return ingredientes.filter { $0.basicIngredient == filtroSeleccionado }
        }
    }

    var body: some View {
        VStack {
            
            HStack {
                Text("Ingredientes")
                            .font(.title)
                Spacer()
            }
            
            // Botones de filtro
            HStack { 
                ForEach(["Todos", "Vegetal", "Carne", "Especia", "Fruta"], id: \.self) { tipo in
                    Button(action: {
                        self.filtroSeleccionado = tipo
                    }) {
                        Text(tipo)
                            .foregroundColor(.white)
                            .padding(5)
                            .background(filtroSeleccionado == tipo ? Color.red : Color.orange)
                            .cornerRadius(10)
                    }
                }
            }

            // Grid de ingredientes
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: .init(.flexible()), count: 5), spacing: 10) {
                                ForEach(ingredientesFiltrados) { ingrediente in
                                    IngredienteView(ingrediente: ingrediente)
                                }
                            }
            }
        }
        .padding()
    }
}

#Preview {
    IngredientesView()
}
