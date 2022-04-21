//
//  MatchDetailView.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/19.
//

import SwiftUI

struct MatchDetailView: View {
    let matchingInfo: MatchRow
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct MatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MatchDetailView(matchingInfo: MatchRowSamples[0])
    }
}
