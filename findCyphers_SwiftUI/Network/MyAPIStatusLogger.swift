//
//  MyAPIStatusLogger.swift
//  findCyphers_SwiftUI
//
//  Created by 이택성 on 2022/04/18.
//

import Foundation
import Alamofire

final class MyApiStatusLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "MyApiStatusLogger")

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        
        guard let statusCode = request.response?.statusCode else {return}
        
        print("MyApiStatusLogger = statusCode : \(statusCode)")
    }
}
