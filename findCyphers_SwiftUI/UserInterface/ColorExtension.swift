//
//  ColorExtension.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/18.
//

import SwiftUI


extension Color {
    
    static let peach = Color("peach")       // 앱에서 사용할 메인 색
    static let primaryShadow = Color.primary.opacity(0.2)   // 그림자로 사용할 색
    static let secondaryText = Color(hex: "#6e6e6e")        // Color.secondary를 대신해 사용할 조금 더 진한 회색
    static let renatocolor = Color(hex: "#112e43")  // 헤나투 색상
    static let background = Color(UIColor.systemGray4)
    
    
    init(hex: String) {
        let scanner = Scanner(string: hex)      //문자열 파서 역할하는 클래스
        _ = scanner.scanString("#")             // #문자 제거
            
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)              // 문자열을 Int64타입으로 변환해 rgb 변수에 저장, 변환이 안되면 0으로 반환
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0          // 좌측 문자열 2개 추출
        let g = Double((rgb >> 8) & 0xFF) / 255.0          // 중간 문자열 2개 추출
        let b = Double((rgb >> 0) & 0xFF) / 255.0          // 좌측 문자열 2개 추출
        
        self.init(red: r, green: g, blue: b)
    }
}


