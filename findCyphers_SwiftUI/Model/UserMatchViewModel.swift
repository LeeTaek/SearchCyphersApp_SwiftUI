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
    @Published var nickname = ""
    @Published var nicknameList = [String]()
    
    var userId: String = ""
    
    init() {
        print(#fileID, #function, #line, "")
   
    }
    
    //MARK: - 유저 ID 호출
    func fetchUserID() {
        print(#fileID, #function, #line, "닉네임: \(self.nickname)")
        
        let userIdURL = MySearchRouter.searchPlayerId(term: self.nickname)
        
        MyAlamofireManager.shared
            .session
            .request(userIdURL)
            .publishDecodable(type: UserInfo.self )
            .compactMap{ $0.value }
            .sink(receiveCompletion: { completion in
                print("UserId 데이터 스트림 성공")
            }, receiveValue: { (receivedValue : UserInfo) in
                print(" 유저 ID : \(receivedValue)")
                guard let userInfo =  receivedValue.rows.first?.playerId else { print("닉네임 없음") ; return }
                self.userId = userInfo
                if !self.nicknameList.contains(self.nickname) {     // 검색 기록에 추가
                    self.nicknameList.append(self.nickname)
                }
                self.fetchMatch()                               //매칭기록 호출 
                
            }).store(in: &subscription)
        
    }
    
  
    
    //MARK: - 최근 매칭 호출
    func fetchMatch() {
        print(#fileID, #function, #line, "")
   
        let matchingURL = MySearchRouter.searchMatches(term: self.userId, gameType: "normal")

        MyAlamofireManager.shared
            .session
            .request(matchingURL)
            .publishDecodable(type: MatchInfo.self)
            .compactMap{ $0.value }
            .map{ $0.matches.rows }
            .sink(receiveCompletion: { completion in
                print("MatchInfo 데이터 스트림 성공")
            }, receiveValue: { (receivedValue : [MatchRow]) in
                print("매칭 데이터 받은 값 : \(receivedValue.count)")
                self.match = receivedValue
            }).store(in: &subscription)
    }
    
    
  
    
    func getUserInfo(_ nickname: String) {
        self.nickname = nickname
        fetchUserID()
    }
    
        
}
 
