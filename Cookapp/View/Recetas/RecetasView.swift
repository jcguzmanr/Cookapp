//
//  RecetasView.swift
//  Cookapp
//
//  Created by Juan Carlos Guzman R on 2/3/24.
//

import SwiftUI

struct RecetasView: View {
    @ObservedObject var viewModel = RecetasViewModel() // Cambio a @ObservedObject
    @State private var textoDeBusqueda = ""
    @State var isPresenting: Bool = false
    
    var recetasFiltradas: [Recipe] {
        if textoDeBusqueda.isEmpty {
            return viewModel.recetas
        } else {
            return viewModel.recetas.filter { receta in
                receta.title.localizedCaseInsensitiveContains(textoDeBusqueda) ||
                receta.ingredients.contains(where: { ingrediente in
                    ingrediente.name.localizedCaseInsensitiveContains(textoDeBusqueda)
                })
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(recetasFiltradas) { receta in
                        NavigationLink(destination: Text(receta.title)) { // Cambiar a la vista de destino adecuada
                            RecetaView(receta: receta)
                            
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Recetas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(
                        action: {
                            isPresenting = true
                        }, label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                            //Text("Filtros")
                        })
                }
                
            }
            .sheet(isPresented: $isPresenting, content: {
                NavigationView{
                    FiltroView()
                }
            })
            .searchable(text: $textoDeBusqueda, placement: .navigationBarDrawer(displayMode: .always))
        }
        .onAppear {
            viewModel.cargarRecetasDesdeJSON()
        }
        
    }
}

#Preview {
    RecetasView()
}
