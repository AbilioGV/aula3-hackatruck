//
//  ViewModel.swift
//  Aula06-d1
//
//  Created by Student on 12/09/23.
//

import SwiftUI
import Foundation

struct Release : Decodable, Hashable {
    let cn: String?
    let global: String?
    }

//struct Art : Decodable, Hashable {
//        let name: String
//        let link: ""
//    }

struct Operator: Decodable, Hashable {
    let name: String?
    let rarity: Int?
    let alter: String?
    let artist: String?
    let va: String?
    let classe: [String]?
    let headhunting: String?
    let recruitable: String?
    let release_dates: Release
//    let art : Art
}

class ViewModel : ObservableObject {
    @Published var chars : [Operator] = []
    
    func fetch(){
        guard let url = URL(string: "https://rhodesapi.up.railway.app/api/operator" ) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Operator].self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
