//
//  FiltroView.swift
//  Cookapp
//
//  Created by Juan Carlos Guzman R on 2/4/24.
//

import SwiftUI

struct FiltroView: View {
    var body: some View {
        ScrollView {
            IngredientesView()
            TiempoView()
        }
        .padding()
        
    }
}

#Preview {
    FiltroView()
}
