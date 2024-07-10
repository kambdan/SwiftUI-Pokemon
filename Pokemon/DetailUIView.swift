//
//  DetailUIView.swift
//  Pokemon
//
//  Created by Juan Cambizaca on 9/7/24.
//

import SwiftUI

struct DetailUIView: View {
    
    var body: some View {
        
        ZStack {
            Color.black // Fondo de color negro
                .edgesIgnoringSafeArea(.all) // Ignora los bordes seguros para cubrir toda la pantalla
           
            VStack {
                Image("detail")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 140)
                    .padding(.top, 60)
                
                VStack {
                    ZStack {
                        Image("Charizard")
                        Text("Charizard")
                            .font(.system(size: 40))
                        .bold().foregroundColor(.white)
                        
                    }
                    Image("fire")
                        .padding(.top, -20)
                    
                    Text("Durante los combates, Charizard puede megaevolucionar a Mega-Charizard X o a Mega-Charizard Mega-Charizard Y es el resultado de la megaevolución de Charizard al equiparlo con una Charizardita Y. ")
                        .font(.system(size: 13))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .foregroundColor(.white)
                }
                .padding(.top, 150)
                Text("Ver Estadísticas")
                    .underline()
                    .foregroundColor(.yellow)
                    .padding(.top, 10)
                ExtractedView()
                       
                    }
            }
        }
    }


#Preview {
    DetailUIView()
}

struct ExtractedView: View {
    @State private var offset: CGFloat = 0
        @State private var isDragging = false
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    // Imagen de fondo
                    Image("swipe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    
                    
                    // Pokéball
                    Image("ball")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                        .offset(y: offset+30)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    isDragging = true
                                    offset = min(0, max(-geometry.size.height + 80, value.translation.height))
                                }
                                .onEnded { _ in
                                    isDragging = false
                                    withAnimation(.spring()) {
                                        offset = 0
                                    }
                                }
                        )
                }
            }
            .padding(.leading, 175)
            .frame(height: 150)
            
            Text("Deslizar")
                .foregroundColor(.white)
        }
    }
}
