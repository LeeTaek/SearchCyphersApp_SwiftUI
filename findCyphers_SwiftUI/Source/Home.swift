//
//  ContentView.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/18.
//

import SwiftUI

struct Home: View {
    @ObservedObject var userMatchViewModel = UserMatchViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                
                matchingList

                
            }.navigationTitle("최근 매칭 기록")
            
        }

        
    }
    

    
    var matchingList: some View {
        List(userMatchViewModel.match, id:\.matchId) { matcingInfo in
            HStack {
                MatchListRow(matcingInfo)
                NavigationLink(destination: MatchDetailView()) {
                    EmptyView()
                }.frame(width: 0)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
