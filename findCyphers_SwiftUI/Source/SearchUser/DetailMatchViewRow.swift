//
//  DetailMatchViewRow.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/27.
//

import SwiftUI
import Kingfisher

struct DetailMatchViewRow: View {
    var player = Player()

    var body: some View {
        VStack {
            HStack {
                characterImage
              
                matchDescription
                
            }
            
            partyPlayer
        }
        
    }
    
    
    
    var characterImage: some View {
        let characterImageURL = URL(string: API.CHARACTER_IMAGE_URL + player.playInfo.characterId)
        
        return KFImage(characterImageURL)
            .frame(width: 70, height: 70)
            .cornerRadius(20)
    }
    
    
    
    var matchDescription: some View {
        VStack {
            HStack {
                Text("킬 \n \(player.playInfo.killCount)" )
                Spacer()
                
                Text("어시스트 \n \(player.playInfo.assistCount)")
                Spacer()
                
                Text("데스 \n \(player.playInfo.deathCount)")
            }
            
            Text("공격량 : \(player.playInfo.attackPoint)")
            
            Text("피해량 : \(player.playInfo.damagePoint)")
            
            Text("힐량 : \(player.playInfo.healAmount)")
            
        }
        
        
    }
    
    
    
    var partyPlayer: some View {
        Text("파티원")
    }
    
    
}

struct DetailMatchViewRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailMatchViewRow()
    }
}
