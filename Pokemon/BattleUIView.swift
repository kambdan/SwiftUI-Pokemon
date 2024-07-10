//
//  BattleUIView.swift
//  Pokemon
//
//  Created by Juan Cambizaca on 9/7/24.
//

import SwiftUI

struct BattleUIView: View {
    var body: some View {
        ZStack{
            Color.black // Fondo de color negro
                .edgesIgnoringSafeArea(.all) // Ignora los bordes seguros para cubrir toda la pantalla
            VStack{
                Text("Campo de Batalla")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    ZStack {
                        Image("azul")
                          
                            .scaledToFit()
                            .frame(width: 250,height: 100)
                            .padding(.trailing, 70)
                        Image("battle_one")
                            .padding(.leading, 60)
                            
                    }
                    Image("vs")
                        
                    ZStack {
                        Image("orange")
                        
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                            .padding(.leading, 10)
                        Image("battle_two")
                            .padding(.trailing, 60)
                          
                           
                       
                    }
                }
                
                HStack{
                    VStack{
                        HStack{
                            Image("perfil_one")
                            Text("Jugador 1")
                                .foregroundColor(.white)
                        }
                        Image("level_on")
                    }
                    .padding(.trailing, 50)
                   
                    VStack{
                        HStack{
                            Image("perfil_two")
                            Text("Tú")
                                .foregroundColor(.white)
                        }
                        Image("level_tw")
                            .scaledToFit()
                    }
                }
                Divider()
                    .background(.white)
                Text("Escoge tu ataque")
                    .font(.title2)
                    .foregroundColor(.white)
                HStack{
                    CardView(title: "Giga Impact", path: "body_one" )
                    CardView(title: "Aerial Ace", path: "body_two" )
                        }
                .padding(.vertical,40)
               
                HStack{
                    CardView(title: "Flamethrower", path: "body_three" )
                    CardView(title: "Dragon Tail", path: "body_four" )
                        }
                }
            
               
            }
              
            }
        }
    


#Preview {
    BattleUIView()
}

struct CardView: View {
    var title: String
    var path: String
    @State private var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            // Fondo redondeado
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.2))
                .frame(width: 170, height: 120)
            
            VStack {
                // Imagen
                Image(path)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 160)
                    .offset(y: -40)
                
                // Texto
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(isSelected ? Color(red: 255/255, green: 67/255, blue: 16/255) : .white)
                    .padding(.top, -50)
            }
        }
        .frame(width: 170, height: 120)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(isSelected ? Color(red: 255/255, green: 228/255, blue: 221/255): Color(red: 34/255, green: 34/255, blue: 34/255)) // Cambia el color basado en isSelected
                .shadow(radius: 10)
        )
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                isSelected.toggle() // Cambia el estado al tocar
            }
        }
    }
}
