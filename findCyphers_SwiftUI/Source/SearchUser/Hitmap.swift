//
//  Hitmap.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/26.
//

import SwiftUI

struct Hitmap: View {
    var matchId: String

    var body: some View {
        hitmap
            .navigationTitle(Text("Hitmap"))
    }
    
    var hitmap: some View {
        let hitmapURL = "https://record-cyphers.neople.co.kr/heatmap/matches/" + self.matchId
        
        return MyWebview(urlToLoad: hitmapURL)
        
    }
}

struct Hitmap_Previews: PreviewProvider {
    static var previews: some View {
        Hitmap(matchId: "b39dc96984c717e7084a0a7bb4017ba5663119fa336ec07ed3798e515b5ead64")
    }
}
