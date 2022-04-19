//
//  MyAlamofireManager.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/18.
//

import SwiftUI
import Foundation
import Alamofire


final class MyAlamofireManager {
    // 싱글턴 적용
    static let shared = MyAlamofireManager()

    // 인터셉터 : 공통 파라미터, 인증, 헤더에 무언가 추가 등
    let interceptors = Interceptor(interceptors:
                                    [
                                        BaseInterceptor()
                                    ]
    )
    
    
    // 로거 이벤트 모니터 설정
    let monitors = [MyLoger(), MyApiStatusLogger()] as [EventMonitor]
    
    
    // 세션 설정
    var session : Session
    
    private init() {
        session = Session(interceptor: interceptors, eventMonitors: monitors)

        
    }
    
}

