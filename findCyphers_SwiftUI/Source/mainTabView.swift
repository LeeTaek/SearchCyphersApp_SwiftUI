//
//  mainTabView.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/20.
//

import SwiftUI

struct mainTabView: View {
    private enum Tabs {
        case home, searchUser, characterInfo, myPage
    }
    
    @State private var selectedTab: Tabs = .home        // 기본값 = 홈
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group{
                home
                searchUser
                characterInfo
                myPage
            }
            .accentColor(.primary)
        }.accentColor(.renatocolor)

    }
}


private extension mainTabView {
    var home: some View {
        Home()
            .tag(Tabs.home)
            .tabItem(image: "house", text: "홈")
//            .onAppear{ UITableView.appearance().separatorStyle = .none }
    }
    
    var searchUser: some View {
        MatchList()
            .tag(Tabs.searchUser)
            .tabItem(image: "person.fill.viewfinder", text: "유저검색")
    }
    
    var characterInfo: some View {
        CharacterInfoList()
            .tag(Tabs.characterInfo)
            .tabItem(image: "person.fill.viewfinder", text: "캐릭터공략")
    }
    
    var myPage: some View {
        Text("마이페이지")
            .tag(Tabs.myPage)
            .tabItem(image: "person", text: "마이페이지")
    }
}

fileprivate extension View {
    func tabItem(image: String, text: String)  -> some View {
        self.tabItem {
            Image(systemName: image)
                .imageScale(.medium)
                .font(Font.system(size: 17, weight: .light))
            Text(text)
        }
    }
}


struct mainTabView_Previews: PreviewProvider {
    static var previews: some View {
        mainTabView()
    }
}
