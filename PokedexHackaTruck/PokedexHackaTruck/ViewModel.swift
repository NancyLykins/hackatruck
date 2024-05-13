//
//  ViewModel.swift
//  PokedexHackaTruck
//
//  Created by Turma01-10 on 09/05/24.
//

import Foundation

struct PokeImages: Codable, Hashable{
    var frontal_default: String?
}

struct Pokemon : Codable, Hashable {
    var species: Species?
    var types: [PokemonTypes]?
    var sprites: PokeImages?
}

struct PokeType: Codable, Hashable{
    var name: String?
}

struct PokemonTypes: Codable, Hashable{
    var type: PokeType?
}

struct Species : Codable, Hashable  {
    var name: String?
}


class ViewModel : ObservableObject {
    @Published var pokemon: [Pokemon] = []
    
    func fetch(pokeId: Int){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokeId)" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(Pokemon.self, from: data)
                
                DispatchQueue.main.async {
                    self!.pokemon.removeAll()
                    self?.pokemon.append(parsed)
                    
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
