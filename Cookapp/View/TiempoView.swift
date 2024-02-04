//
//  TiempoView.swift
//  Cookapp
//
//  Created by Juan Carlos Guzman R on 2/4/24.
//

import SwiftUI

struct TiempoView: View {
    // Definir los intervalos de tiempo
       let times = [5, 10, 20, 30, 45]
       @State private var selectedTime: Int?

       var body: some View {
           VStack {
                       // Título
               HStack {
                   Text("Tiempo")
                               .font(.title)
                               .fontWeight(.bold)
                   Spacer()
               }

                       // SF Symbols de relojes y textos de tiempo
               ScrollView(.horizontal, showsIndicators: false) {
                   HStack(spacing: 20) {
                               ForEach(times, id: \.self) { time in
                                   Button(action: {
                                       // Actualizar el tiempo seleccionado
                                       self.selectedTime = time
                                   }) {
                                       VStack {
                                           Image(systemName: "timelapse")
                                               .font(.largeTitle)
                                               .foregroundColor(selectedTime == time ? .white : .gray)
                                               .frame(width: 50, height: 50)
                                               .background(selectedTime == time ? Color.black : Color.gray.opacity(0.5))
                                               .clipShape(Circle())

                                           Text("\(time) min")
                                               .padding(.top, 5)
                                       }
                                   }
                                   .buttonStyle(PlainButtonStyle()) // Para que se parezca a un botón regular
                               }
                   }
               }
                   }
               }
}

#Preview {
    TiempoView()
}
