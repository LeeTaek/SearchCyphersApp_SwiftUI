//
//  FavoriteButton.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//
//
import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var characters : CharacterViewModel
    var character : CharacterInfo
    
    
    var body: some View {
        // 하트 버튼
        Button(action: {
            self.characters.toggleFavorite(of: self.character)
        }) {
            Image(systemName: heartImage)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.renatocolor)
                .padding(.trailing, 30)
              
        }
    }
    
    var heartImage : String {
        character.isFavorite ? "heart.fill" : "heart"
    }
    
    
    
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(character: CharacterSamples[0])
    }
}
