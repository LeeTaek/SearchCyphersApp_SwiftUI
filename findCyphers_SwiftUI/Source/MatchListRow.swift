//
//  MatchListRow.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/18.
//

import SwiftUI
import Alamofire
import Kingfisher

struct MatchListRow: View {
    let matchInfo: MatchRow
    
    var body: some View {
        VStack(spacing: 0) {
                HStack {
                    Text("\(matchInfo.playInfo.res)")
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Text("날짜: \(matchInfo.date)")
                        .font(.body)
                        .fontWeight(.medium)
                }.padding([.leading, .trailing])
            
            
                HStack {
                    self.characterImage
                    self.matchDescription
                }.padding([.leading, .trailing])
        
        }
        .frame(height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: Color.primaryShadow, radius: 1, x: 2, y: 2)
        .padding(.vertical, 8)

        
        
        
    }
    
    var characterImage: some View {
        GeometryReader { _ in
            let characterImageURL = URL(string: API.CHARACTER_IMAGE_URL + matchInfo.playInfo.characterId)
           
            KFImage.url(characterImageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)

             
        }.frame(width: 100, height: 100)
    }
    
    
    var matchDescription: some View {
       
        VStack() {
            // 이름 + 레벨
            HStack {
    
                Text("\(matchInfo.playInfo.characterName)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
                Spacer()
                
               
            
                Text("Lv : \(matchInfo.playInfo.level.description)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
            }
            
            /// 맵, KDA
            HStack {
                
                let KDA : Double = 0
                Text("\(matchInfo.map.name)")
                    .font(.body)
                Spacer()
                Text("KDA : \(String(format: "%.2f", KDA))")
                    .font(.body)
                
            }
            
            position
            
        }   .padding([.leading, .bottom], 12)
            .padding([.top, .trailing], 12)
        
    }
    
    // 포지션, 특성

    var position: some View {
        HStack {
            let attributeImageURL1 = URL(string: API.ATTRIBUTE_IMAGE_URL + matchInfo.position.attribute[0].id)

            let attributeImageURL2 = URL(string: API.ATTRIBUTE_IMAGE_URL + matchInfo.position.attribute[1].id)

            let attributeImageURL3 = URL(string: API.ATTRIBUTE_IMAGE_URL + matchInfo.position.attribute[2].id)
            
            Text("포지션")
            Spacer()
            
            KFImage(attributeImageURL1)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(16)
            
            KFImage(attributeImageURL2)
                .frame(width: 40, height: 40)
                .cornerRadius(16)
            
            KFImage(attributeImageURL3)
                .frame(width: 40, height: 40)
                .cornerRadius(16)
            
        }
    }

}


private extension MatchListRow {
    
 
    
    
}



struct MatchListRow_Previews: PreviewProvider {
    static var previews: some View {
        MatchListRow(matchInfo: MatchRowSamples[0])
    }
}
