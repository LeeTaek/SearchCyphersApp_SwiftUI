//
//  FavoriteCharacterScrollView.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/21.
//

import SwiftUI
import Kingfisher

struct FavoriteCharacterScrollView: View {
    @EnvironmentObject private var characterVM: CharacterViewModel
    @Binding var showingImage: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            title
            
            if showingImage {
                characters
            }
            
        }.padding()
            .transition(.slide)
    }
    
    //MARK: - 캐릭터 창 타이틀
    var title: some View {
        HStack(alignment: .top, spacing: 5) {
            Text("즐겨찾는 캐릭터")
                .font(.headline)
                .fontWeight(.medium)
            
            Image(systemName: "arrowtriangle.up.square")
                .imageScale(.medium)
                .foregroundColor(.renatocolor)
                .padding(4)
                .rotationEffect(Angle(radians: showingImage ? .pi : 0))

            Spacer()
            
        }.padding(.bottom, 4)
            .onTapGesture {
                withAnimation {
                    self.showingImage.toggle()
                }
            }
        
    }
    
    
    //MARK: - 캐릭터 스크롤뷰
    var characters: some View {
        let favoriteCharacters = characterVM.characters.filter { $0.isFavorite }
        
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 0) {
                ForEach(favoriteCharacters) { character in
                    NavigationLink(destination: DetailCharacterInfo()) {
                        self.eachCharacter(character)
                    }
                }
            }
        }.animation(.spring(dampingFraction: 0.78))
    }
    
    
    //MARK: - 캐릭터 이미지
    func eachCharacter(_ character: CharacterInfo) -> some View {
        GeometryReader { geometry in
            let ImageURL = URL(string: API.CHARACTER_IMAGE_URL + character.characterId.characterId)
            
            VStack {
                KFImage(ImageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
           
                
                Text("\(character.characterId.characterName)")
                    .font(.body)
                    .fontWeight(.medium)
                    
            }.scaleEffect(self.scaledValue(from: geometry))
                .padding(.top, 1)
        
            
        }.frame(width: 105, height: 105)
    }
    
    
    //MARK: - 캐릭터 이미지 사이즈 조절
    func scaledValue(from geometry: GeometryProxy) -> CGFloat {
        let xOffset = geometry.frame(in: .global).minX - 16 // 글로벌 좌표 기준으로 상품의 x값을 구하고, 그 값에 적용된 여백 값만큼 빼주면 한 contentOffset 얻을 수 있음.
        
        let minSize: CGFloat = 0.8
        let maxSize: CGFloat = 1.0
        let delta: CGFloat = maxSize - minSize
        
        let size = minSize + delta * (1 - xOffset / UIScreen.main.bounds.width)
        
        return max(min(size, maxSize), minSize)
        
    }
    
}

//struct FavoriteCharacterScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteCharacterScrollView(showingImage: true )
//
//    }
//}
