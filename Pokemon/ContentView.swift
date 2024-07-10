//
//  ContentView.swift
//  Pokemon
//
//  Created by Juan Cambizaca on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    
    let pokemonImages = ["frame_one", "frame_two", "frame_three"]
        @State private var currentIndex = 2
        
        var body: some View {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
               
                Image("fond")
                    .resizable()
                    .scaledToFill()
                    .rotationEffect(.degrees(10))
                    .padding(.trailing, 150)
                    .padding(.bottom, 100)
                    .frame(height: 600)
               
                VStack() {
                   
                        HStack {
                            
                            Spacer()
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.white)
                        }
                        .padding()
                        Text("Selecciona tu")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.trailing,200)
                    HStack {
                        Text("Pokemon")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                        Image("poke")
                    }
                    .padding(.trailing, 180)
                    
                    
                    GeometryReader { geometry in
                        HStack {
                            Spacer()
                            ZStack {
                                ForEach(0..<pokemonImages.count, id: \.self) { index in
                                    Image(pokemonImages[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: getImageSize(index: index, currentIndex: currentIndex).width,
                                               height: getImageSize(index: index, currentIndex: currentIndex).height)
                                        .offset(y: getOffset(index: index, in: geometry.size))
                                        .rotationEffect(getRotation(index: index, currentIndex: currentIndex))
                                        .zIndex(getZIndex(index: index, currentIndex: currentIndex))
                                }
                            }
                            .frame(width: geometry.size.width * 0.6)
                        }
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    if value.translation.height < -20 {
                                        withAnimation {
                                            currentIndex = (currentIndex + 1) % pokemonImages.count
                                        }
                                    } else if value.translation.height > 20 {
                                        withAnimation {
                                            currentIndex = (currentIndex - 1 + pokemonImages.count) % pokemonImages.count
                                        }
                                    }
                                }
                        )
                    }
                    .frame(height: 500)
                    
                    Text("\(pokemonImages.count) Pokemons en tú Pokédex")
                                    .foregroundColor(.white)
                                    .padding(.bottom)
                                    .lineLimit(3)
                                    .frame(width: 100,height: 90)
                                    .padding(.trailing, 260)
                                   
                                    
                }
            }
        }
        
        func getOffset(index: Int, in size: CGSize) -> CGFloat {
            let diff = CGFloat(index - currentIndex)
            let screenHeight = size.height
            return diff * (screenHeight * 0.31) // Ajustado para estar más apegados
        }
        
        func getImageSize(index: Int, currentIndex: Int) -> CGSize {
            if index == currentIndex {
                return CGSize(width: 450, height: 450) // Imagen central más grande
            } else {
                return CGSize(width: 300, height: 300) // Imágenes laterales más pequeñas
            }
        }
        
        func getRotation(index: Int, currentIndex: Int) -> Angle {
            let diff = index - currentIndex
            if diff == -1 {
                return .degrees(15) // Imagen de arriba se inclina hacia arriba
            } else if diff == 1 {
                return .degrees(-15) // Imagen de abajo se inclina hacia abajo
            } else {
                return .degrees(0) // Imagen central y las demás sin inclinación
            }
        }
        
        func getZIndex(index: Int, currentIndex: Int) -> Double {
            return index == currentIndex ? 1 : 0
        }
    }
#Preview {
    ContentView()
}

struct PokemonCardView: View {
    let name: String
    let image: String
    let type: String
    let evolution: String
    let color: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(type)
                    Text(evolution)
                }
                Spacer()
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
            .padding()
        }
        .frame(height: 120)
        .padding(.horizontal)
    }
}
