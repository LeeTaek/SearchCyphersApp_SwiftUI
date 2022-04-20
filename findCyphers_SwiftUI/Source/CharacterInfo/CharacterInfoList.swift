//
//  CharacterInfoList.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import SwiftUI

struct CharacterInfoList: View {
    
    @EnvironmentObject var charcter : CharacterViewModel
    
    var body: some View {
        NavigationView {
            List(charcter.characters) { cha in
                HStack {
                    CharacterInfoRow(character: cha)
                    NavigationLink(destination: DetailCharacterInfo()) {
                        EmptyView()
                    }.frame(width: 0)
                }
                .buttonStyle(PlainButtonStyle())   //네비게이션보다 좋아요 버튼에 우선권을 줌.
                    .navigationTitle("캐릭터 정보")
                    .font(.body)
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
