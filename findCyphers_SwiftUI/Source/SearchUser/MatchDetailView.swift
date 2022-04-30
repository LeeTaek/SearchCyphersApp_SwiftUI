//
//  MatchDetailView.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/19.
//

import SwiftUI

struct MatchDetailView: View {
    let matchingInfo: MatchRow
    @ObservedObject var detailMatchInfo = DetailMatchViewModel()
    
    private let gameResult = ["승리", "패배"]

    
    var body: some View {
        VStack{
            matchDescription
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
        
                NavigationLink(destination: Hitmap(matchId: matchingInfo.matchId)) {
                   Image(systemName: "map")
                        .foregroundColor(.renatocolor)
                }
                
            }
        }
        .navigationBarTitle(Text("매칭 상세 기록"), displayMode: .inline)
        
    }
    
    
    
    
    
    var matchDescription: some View {
        detailMatchInfo.fetchDetailMatch(matchId: matchingInfo.matchId)
        
        return List(detailMatchInfo.detailMatchInfo.players, id: \.playerId) {  player in

           HStack {
               Text("\(player.nickname)")
           }
        }
    }
    
    
    
}


struct MatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MatchDetailView(matchingInfo: MatchRowSamples[0])
    }
}
