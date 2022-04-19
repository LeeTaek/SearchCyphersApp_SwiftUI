//
//  UserMatchViewModel.swift
//  findCyphers_SwiftUI
//  네트워크를 통해 매칭 기록 가져와 Combine으로 연결
//  Created by 이택성 on 2022/04/19.
//

import Foundation
import Combine
import Alamofire

class UserMatchViewModel: ObservableObject {
    
    //MARK: Properties
    var subscription = Set<AnyCancellable>()
    
    @Published var match = [MatchRow]()
    
    
    
    init() {
        print(#fileID, #function, #line, "")
        fetchUser()
    }
    
    
    func fetchUser() {
        print(#fileID, #function, #line, "")
   
        let matchingURL = MySearchRouter.searchMatches(term: "be9f5ed18e0acee9a535e3c89533546a", gameType: "normal")

        MyAlamofireManager.shared
            .session
            .request(matchingURL)
            .publishDecodable(type: MatchInfo.self)
            .compactMap{ $0.value }
            .map{ $0.matches.rows }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 성공")
            }, receiveValue: { (receivedValue : [MatchRow]) in
                print("받은 값 : \(receivedValue.count)")
                self.match = receivedValue

            }).store(in: &subscription)

    }
        
}
 
