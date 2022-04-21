//
//  MatchList.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import SwiftUI

struct MatchList: View {
    @EnvironmentObject private var characters : CharacterViewModel
    @ObservedObject var userInfo = UserMatchViewModel()
    @State var nickname: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                searchUser
                    .padding([.top, .bottom], 10)
                
                if showSearchRecord {
                    searchRecord
                }
                
             
                
                Spacer()
                
                matchingList
               

            } .buttonStyle(PlainButtonStyle()) 
                .navigationTitle("최근 매칭 기록")
        }

    }
    
    //MARK: - 매칭 리스트
    var matchingList: some View {
        List(userInfo.match, id:\.matchId) { matchingInfo in
            HStack {
                MatchListRow(matchInfo: matchingInfo)
                    .animation(.easeInOut)
                NavigationLink(destination: MatchDetailView(matchingInfo: matchingInfo)) {
                    EmptyView()
                }.frame(width: 0)
            }
        }
    }
    
    //MARK: - 검색기록 보여줄까?
    var showSearchRecord: Bool {
        !userInfo.nicknameList.isEmpty
    }
    
    
    
    //MARK: - 닉네임 검색 창
    var searchUser: some View {
        HStack {
            TextField("닉네임을 입력하세요", text: $nickname, onCommit: {
                print(#fileID, #function, #line, "닉네임: \(self.nickname)")
                userInfo.getUserInfo(self.nickname)
                
            })
                .foregroundColor(.renatocolor)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                
            if self.nickname.count > 0 {
                Button(action: { self.nickname = "" }) {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.renatocolor)
                        .padding(.trailing, 20)
                }
            }

        }.frame(height: 20)
    }

    
    //MARK: - 검색기록
    var searchRecord: some View {
        ScrollView(.horizontal, showsIndicators:  false) {
          
            HStack (spacing: 15) {
                ForEach(userInfo.nicknameList, id:\.self) { nick in
                    
                    Button(action: { self.nickname = nick }) {
                        Text("  \(nick)  ")
                            .font(.body).fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(minWidth: 40, maxWidth: 200, minHeight: 30 )
                            .background(Color.renatocolor)
                            .cornerRadius(6)
                        }
                    }
            
                }.frame(height: 40)
        }.padding([.leading, .trailing])
            .transition(.opacity)
    }
}

struct MatchList_Previews: PreviewProvider {
    static var previews: some View {
        MatchList()
    }
}
