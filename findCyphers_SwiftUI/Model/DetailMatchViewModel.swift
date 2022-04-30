//
//  DetailMatchViewModel.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/27.
//

import Foundation
import Alamofire
import Combine

class DetailMatchViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()

    @Published var detailMatchInfo = DetailMatchInfo()
    
    init() {
        print(#fileID, #function, #line, "")
    }
    
    //MARK: - 매칭 디테일 정보 호출
    func fetchDetailMatch(matchId: String) {
        print(#fileID, #function, #line, "")
        
        let detailMatchingURL = MySearchRouter.searchDetailMatching(term: matchId)
        
        MyAlamofireManager.shared
            .session
            .request(detailMatchingURL)
            .publishDecodable(type: DetailMatchInfo.self)
            .compactMap{ $0.value }
            .sink(receiveCompletion: { completion in
                print("DetailMatchInfo 데이터 스트림 성공")
                
            }, receiveValue: { (recievedValue: DetailMatchInfo) in
                print("플레이한 맵 \(recievedValue.teams.first!.players.first!)")
                self.detailMatchInfo = recievedValue
                
            }).store(in: &subscription)
        
    }
}
