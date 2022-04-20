//
//  MatchList.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import SwiftUI

struct MatchList: View {
    @ObservedObject var userMatchViewModel = UserMatchViewModel()
    @EnvironmentObject private var characters : CharacterViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                
                matchingList

            } .buttonStyle(PlainButtonStyle()) 
            .navigationTitle("최근 매칭 기록")
        }

    }
    

    var matchingList: some View {
        List(userMatchViewModel.match, id:\.matchId) { matcingInfo in
            HStack {
                MatchListRow(matchInfo: matcingInfo)
                NavigationLink(destination: MatchDetailView()) {
                    EmptyView()
                }.frame(width: 0)
            }
        }
    }
    

    
}

struct MatchList_Previews: PreviewProvider {
    static var previews: some View {
        MatchList()
    }
}
