//
//  RecetaView.swift
//  Cookapp
//
//  Created by Juan Carlos Guzman R on 2/3/24.
//
import SwiftUI

struct RecetaView: View {
    var receta: Recipe

    // Datos de prueba para el tiempo de preparación y la dificultad
    let tiempoPreparacion = "20 min"
    let dificultad = "Media"

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Spacer()
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 28, height: 24)
                    .padding()
            }
            
            Text(receta.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Image(systemName: "fork.knife")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding(.horizontal)
            
            Text(receta.introduction.text) // Asumiendo que esta propiedad se agregará al modelo
                .padding(.horizontal)
            
            HStack {
                Image(systemName: "timer")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(tiempoPreparacion)
                Spacer()
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(dificultad)
            }
            .padding(.horizontal)
            
            Divider().padding(.horizontal)
            
            Text("Ingredientes:")
                .font(.headline)
                .padding(.horizontal)
            Text("\(receta.ingredients.count)")

            // Grid de ingredientes usando LazyVGrid
            ScrollView(.horizontal) {
                IngredientsListView(ingredients: receta.ingredients)
            }
            .padding(.horizontal)
        }
        .foregroundColor(Color.primary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
    
}

#Preview {
    RecetaView(receta: Recipe.dummyData)
}


