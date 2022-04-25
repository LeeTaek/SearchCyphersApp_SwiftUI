//
//  FavoriteButton.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//
//
import SwiftUI
import RealmSwift

struct FavoriteButton: View {
    @EnvironmentObject private var characters : CharacterViewModel
//    @ObservedResults(FavoriteCharacters.self) var favoriteChar
    var favoriteChar = FavoriteCharacters()
    var character : CharacterInfo
    
    
    var body: some View {
        // 하트 버튼
        
        Image(systemName: heartImage)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.renatocolor)
            .onTapGesture {
                withAnimation { // 즐겨찾기 여부 추가 
                    self.characters.toggleFavorite(of: self.character)
                    self.favoriteChar.toggleFavorite(character: self.character)
//                    if let char = self.favoriteChar. {
//                        char.toggleFavorite(character: self.character)
//                    }
                }
            }
    }
    
    var heartImage : String {
        character.isFavorite ? "heart.fill" : "heart"
//        if let char = self.favoriteChar.first {
//            if char.is {
//                return "heart.fill"
//            }
//            return "heart"
//
//        }
//        return "heart"
    }
    
    
    
    
    
    
    
}

//struct FavoriteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteButton(character: CharacterSamples[0])
//    }
//}
