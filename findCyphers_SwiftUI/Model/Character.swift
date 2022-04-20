//
//  Character.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import Foundation

struct Character : Codable {
    let rows : [CharacterId]
}


struct CharacterId : Codable, Equatable, Identifiable {
    var id: String { characterId }
    
    let characterId: String
    let characterName: String
}



struct CharacterInfo: Codable, Identifiable, Equatable  {
    var id: String { characterId.characterId }
    let characterId: CharacterId
    
    var isFavorite: Bool 
}




let CharacterSamples = [
    CharacterInfo(characterId: CharacterRowSamples[0], isFavorite: false),
    CharacterInfo(characterId: CharacterRowSamples[1], isFavorite: false),
    CharacterInfo(characterId: CharacterRowSamples[2], isFavorite: true)
]


let CharacterRowSamples = [ CharacterId(characterId: "c603a74ba02374026a535dc53e5b8d40", characterName: "로라스"),
    CharacterId(characterId: "d69971a6762d94340bb2332e8735238a", characterName: "휴톤"),
    CharacterId(characterId: "4ff1922f862cae2cc98a6d498e76ef2b", characterName: "루이스")]

