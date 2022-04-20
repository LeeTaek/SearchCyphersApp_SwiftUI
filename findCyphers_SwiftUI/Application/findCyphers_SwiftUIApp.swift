//
//  findCyphers_SwiftUIApp.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/18.
//

import SwiftUI

@main
struct findCyphers_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            mainTabView()
                .environmentObject(CharacterViewModel())

        }
    }
}
