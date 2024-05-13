//
//  ContentView.swift
//  PokedexHackaTruck
//
//  Created by Turma01-10 on 09/05/24.
//

import SwiftUI


struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State var pokemonId: Int = 1
    var body: some View {
        
        ZStack{
            Image("foreground")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                
                ScrollView{
                    ForEach(vm.pokemon, id: \.self) { i in
                        Text((i.species?.name!)!).foregroundStyle(.black).textCase(.uppercase)
                            .font(.system(size: 30))
                        Spacer()
                        HStack{
                            ForEach(i.types!, id: \.self) { t in
                                Spacer()
                                    Image((t.type?.name!)!)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                            }
                            Spacer()
                        }
                    }

                    VStack{
                        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonId).png"))
                        { image in
                            image
                                .resizable()
                                .frame(width: 300, height: 275)
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        } placeholder: {
                            Color.black
                        }
                        Spacer()
                        HStack{
                            Spacer()
                            Image(systemName: "arrowshape.backward.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    if(pokemonId != 1){
                                        pokemonId -= 1
                                    } else {
                                        pokemonId = 10277
                                    }
                                    vm.fetch(pokeId: pokemonId)
                                }
                            Spacer()
                            Image(systemName: "arrowshape.forward.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    if(pokemonId != 10277){
                                        pokemonId += 1
                                    } else {
                                        pokemonId = 1
                                    }
                                    vm.fetch(pokeId: pokemonId)
                                }
                            Spacer()
                        }
                    }.offset(y: 200)
                    
                }
            }
        }.onAppear(){
            vm.fetch(pokeId: pokemonId)
            
        }
    }
}

#Preview {
    ContentView()
}
