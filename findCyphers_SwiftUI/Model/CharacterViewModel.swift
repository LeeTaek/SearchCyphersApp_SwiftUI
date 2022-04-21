//
//  CharacterViewModel.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import Foundation
import Combine
import Alamofire

class CharacterViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var characters = [CharacterInfo]()
    
    init() {
        print(#fileID, #function, #line, "")
        fetchCharacter()
    }
    
    
    //MARK: - 전체 캐릭터 아이디 및 이름 호출
    func fetchCharacter() {
        MyAlamofireManager.shared
            .session
            .request(API.CHARACTER_SEARCH_URL)
            .publishDecodable(type: Character.self)
            .compactMap{ $0.value }
            .sink(receiveCompletion: { comletion in
                print("데이터 스트림 성공")
            }, receiveValue: { (receivedValue : Character) in
                print("캐릭터 수 : \(receivedValue.rows.count)")
                var cha = [CharacterInfo]()
                for i in 0..<receivedValue.rows.count {
                    cha.append(CharacterInfo(characterId: receivedValue.rows[i], isFavorite: false))
                }
                self.characters = cha
            }).store(in: &subscription)
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
