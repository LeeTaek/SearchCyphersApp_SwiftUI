//
//  DetailMatchView.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/18.
//

import SwiftUI
import Alamofire
import Kingfisher

struct DetailMatchView: View {
    let matchInfo: MatchRow
    var KDA: Double = 0
    
//    if matchInfo.playInfo.deathCount != 0 {
//        KDA = Double(matchInfo.playInfo.killCount + matchInfo.playInfo.assistCount) / Double(matchInfo.playInfo.deathCount)
//    }
//
    
    
    var body: some View {
        VStack(spacing: 0) {
                HStack {
                    Text("승패")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Text("날짜")
                    
                }
            
            
            HStack {
                self.matchDescription
            }
        
            }
        
    }
    
    var characterImage: some View {
        GeometryReader { _ in
            let characterImageURL = URL(string: API.CHARACTER_IMAGE_URL + matchInfo.playInfo.characterId)
            let renderingMode : Image.TemplateRenderingMode? = nil
            
           
            KFImage.url(characterImageURL)
                .renderingMode(renderingMode)
                .resizable()
//                .aspectRatio(contentMode: .fill)
        }
    }
    
    var matchDescription: some View {
       
        VStack (alignment: .leading, spacing: 16) {
            HStack {
    
                Text("\(matchInfo.playInfo.characterName)")
                    .font(.title2)
                    .fontWeight(.medium)

                Spacer()
            
                Text("\(matchInfo.playInfo.level.description)")
                    .font(.title2)
                    .fontWeight(.medium)
            }
            
            HStack {
                Text("\(matchInfo.map.name)")
                Spacer()
                Text("KDA : \(self.KDA)")
            }
            
            HStack {
                let attributeImageURL1 = URL(string: API.ATTRIBUTE_IMAGE_URL + matchInfo.position.attribute[0].id)

                let attributeImageURL2 = URL(string: API.ATTRIBUTE_IMAGE_URL + matchInfo.position.attribute[1].id)

                let attributeImageURL3 = URL(string: API.ATTRIBUTE_IMAGE_URL + matchInfo.position.attribute[2].id)
                
                Text("포지션")
                
                KFImage(attributeImageURL1)
                    .cornerRadius(16)
                
                KFImage(attributeImageURL2)
                    .cornerRadius(16)
                
                KFImage(attributeImageURL3)
                    .cornerRadius(16)
                
                

                
                
            }
            
            
            
        }
    }
    
    
}

struct DetailMatchView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMatchView(matchInfo: MatchRowSamples[0])
    }
}
