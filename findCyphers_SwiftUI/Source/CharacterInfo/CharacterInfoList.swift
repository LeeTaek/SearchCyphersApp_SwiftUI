//
//  CharacterInfoList.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import SwiftUI

struct CharacterInfoList: View {
    
    @EnvironmentObject var characterVM : CharacterViewModel
    @State private var showingFavoriteCharacters: Bool = true

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
        !characterVM.characters.filter{ $0.isFavorite }.isEmpty
    }
    
    //MARK: - 선호 캐릭터 창
    var favoriteCharacters: some View {
        FavoriteCharacterScrollView(showingImage: $showingFavoriteCharacters)
            .padding(.top, 24)
            .padding(.bottom, 8)
    }
    
    //MARK: - 캐릭터 리스트
    var characterList: some View {
        List(characterVM.characters) { cha in
            HStack {
                CharacterInfoRow(character: cha)
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
