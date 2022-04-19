//
//  MatchList.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/19.
//

import SwiftUI

struct MatchList: View {
    
    @ObservedObject var userMatchViewModel = UserMatchViewModel()
    
    var body: some View {
        NavigationView {
            List(userMatchViewModel.match, id:\.matchId) { matcingInfo in
                NavigationLink(destination: MatchDetailView()) {
                    MatchListRow(matcingInfo)
                }
            }.navigationTitle("매칭 기록")
        }
      
    }

}

struct MatchList_Previews: PreviewProvider {
    static var previews: some View {
        MatchList()
    }
}
