//
//  FavoriteCharacters.swift
//  findCyphers_SwiftUI
//
//  Realm에 선호 캐릭터 추가하기 위한 클래스
//
//  Created by 이택성 on 2022/04/25.
//

import Foundation
import RealmSwift

class FavoriteCharacters: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String = ""
    @Persisted var isFavorite: Bool = false
    var charactersList = RealmSwift.List<FavoriteCharacters>()

    
    convenience init(id: String, name: String, isFavorite: Bool) {
        self.init()
        self.id = id
        self.name = name
        self.isFavorite = isFavorite
    }
    
    
    // Realm에 추가
    func appendCharacter(character: CharacterInfo ) {
        print(#fileID, #function, #line, "경로: \(Realm.Configuration.defaultConfiguration.fileURL!)")
        
        let realm = try! Realm()

        let favoriteCharacter = FavoriteCharacters(id: character.characterId.id, name: character.characterId.characterName, isFavorite:  character.isFavorite)
        
        try! realm.write{
            realm.add(favoriteCharacter)
        }
    }
    
    
    // 해당 캐릭터의 데이터가 존재하는지 확인
    func isContains(character: CharacterInfo) -> Bool {
        
        let realm = try! Realm()
        
        guard let _ = realm.object(ofType: FavoriteCharacters.self, forPrimaryKey: character.characterId.characterId) else { return false}
        
        return true
                
    }
    
    
    // 업데이트
    func toggleFavorite(character: CharacterInfo) {

        let realm = try! Realm()
        let updateChar = realm.object(ofType: FavoriteCharacters.self, forPrimaryKey: character.characterId.characterId)
        
        try! realm.write{
            updateChar?.isFavorite.toggle()
        }
        
        
    }
    
    // 삭제
    func removeCharacter(character: CharacterInfo) {
        
        let realm = try! Realm()
        let removeChar = realm.object(ofType: FavoriteCharacters.self, forPrimaryKey: character.characterId.characterId)
        
        try! realm.write{
            realm.delete(removeChar!)
        }
    }
    
    
    // 캐릭터
    func aCharacter() -> CharacterInfo {
        CharacterInfo(characterId: CharacterId(characterId: self.id, characterName: self.name), isFavorite: self.isFavorite)
    }
    
    
}
