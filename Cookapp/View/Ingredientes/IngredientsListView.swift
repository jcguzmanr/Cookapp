//
//  IngredientsListView.swift
//  Cookapp
//
//  Created by jcguzmanr on 2/16/24.
//

import SwiftUI

struct IngredientsListView: View {
    let ingredients: [RecipeIngredient]
    
    var body: some View {
        HStack{
            ForEach(ingredients, id: \.id) { ingredient in
                HStack {
                    Text(ingredient.name)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(ingredient.quantity) \(ingredient.scale)")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 2)
            }
        }
    }
}

#Preview {
    IngredientsListView(ingredients: Recipe.dummyData.ingredients)
}
