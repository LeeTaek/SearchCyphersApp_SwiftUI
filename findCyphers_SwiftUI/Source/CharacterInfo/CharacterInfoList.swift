//
//  CharacterInfoList.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import SwiftUI
import RealmSwift


struct CharacterInfoList: View {
    @State private var showingFavoriteCharacters: Bool = true
    @ObservedResults(FavoriteCharacters.self) var favorite

    var body: some View {
        
        NavigationView {
            VStack {
                
                if showFavorite {
                    favoriteCharacters
                }
                
                Color.primary
                    .opacity(0.3)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                
                characterList
                
            }   .buttonStyle(PlainButtonStyle())   //네비게이션보다 좋아요 버튼에 우선권을 줌.
                .navigationTitle("캐릭터 정보")
                .font(.body)
       
        }

    }
    
    
    //MARK: - 선호 캐릭터 보여줄까?
    var showFavorite: Bool {
        var result = false
        
        favorite.forEach {
            if $0.isFavorite == true {
                result = true
            }
        }
    
        return result
    }
    
    
    
    //MARK: - 선호 캐릭터 리스트
    var favoriteCharacters: some View {
        FavoriteCharacterScrollView(showingImage: $showingFavoriteCharacters)
            .padding(.top, 12)
            .padding(.bottom, 8)
    }
    
    

    
    //MARK: - 전체 캐릭터 리스트
    var characterList: some View {
        List(favorite) { cha in
            HStack {
                CharacterInfoRow(character: cha.aCharacters())
                NavigationLink(destination: DetailCharacterInfo()) {
                    EmptyView()
                }.frame(width: 0)
            }
        }
    }
    
    
    
}

struct CharacterInfoList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoList()
            .environmentObject(CharacterViewModel())

    }
}
