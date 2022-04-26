//
//  CharacterViewModel.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import Combine
import Alamofire
import RealmSwift
import SwiftUI

class CharacterViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    var favoriteChar = FavoriteCharacters()
    @Published var characters = [CharacterInfo]()

    init() {
        print(#fileID, #function, #line, "")
        updateCharacter()
        fetchCharacter()
    }
    
    
    //MARK: - API로 전체 캐릭터 아이디 및 이름 호출
    func updateCharacter() {
        MyAlamofireManager.shared
            .session
            .request(API.CHARACTER_SEARCH_URL)
            .publishDecodable(type: Character.self)
            .compactMap{ $0.value }
            .sink(receiveCompletion: { comletion in
                print("데이터 스트림 성공")
            }, receiveValue: { (receivedValue : Character) in
                print("캐릭터 수 : \(receivedValue.rows.count)")
                for i in 0..<receivedValue.rows.count {
                    let aCharacter = CharacterInfo(characterId: receivedValue.rows[i], isFavorite: false)
                                        
                    // 새로운 캐릭터가 있다면 realm 데이터베이스에 업로드
                    if !self.favoriteChar.isContains(character: aCharacter) {
                        self.favoriteChar.appendCharacter(character: aCharacter)
                    }
                  
                }
            }).store(in: &subscription)
    }
    
    
    
    //MARK: - realm 데이터베이스에서 캐릭터 정보를 가져옴
    func fetchCharacter() {
        let realm = try! Realm()
        let savedDatas = realm.objects(FavoriteCharacters.self)
        var charList = [CharacterInfo]()
        
        savedDatas.forEach{
            charList.append($0.aCharacter())
        }
        
        self.characters = charList
    }

    
    
    
    //MARK: - 선호 캐릭터 설정 토글
    func toggleFavorite(of character: CharacterInfo) {
        guard let index = characters.firstIndex(of: character) else { return }
        characters[index].isFavorite.toggle()
    }
        
    
    
    
    //MARK: - 캐릭터 아이디를 가지고 캐릭터 선호캐릭터 여부와 정보 호출
    func findCharInfo(of character: CharacterId) -> CharacterInfo {
        return characters.filter{ $0.characterId == character }[0]
    }
    
    
}
