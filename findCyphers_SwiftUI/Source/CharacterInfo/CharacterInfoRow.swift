//
//  CharacterInfoRow.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import SwiftUI
import Kingfisher

struct CharacterInfoRow: View {
    @EnvironmentObject private var characters : CharacterViewModel
    var character : CharacterInfo
    
    var body: some View {
        HStack{
            let ImageURL = URL(string: API.CHARACTER_IMAGE_URL + character.characterId.characterId)
            
            KFImage(ImageURL)
                .resizable()
                .frame(width: 45, height: 45)
                .cornerRadius(20)
                .padding(.leading, 10)
            
            
            Text(character.characterId.characterName)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.leading, 10)
            
            Spacer()
            
            
            FavoriteButton(character: character)
            
           
            
        }.frame(height:80)
    
    }
    
   
}

struct CharacterInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoRow(character: CharacterSamples[2])

    }
}
