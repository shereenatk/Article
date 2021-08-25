//
//  NetworkConstants.swift
//  Popular Article
//
//  Created by Development  on 25/08/2021.
//

import Foundation
import Foundation
enum NetworkConstants: Int {
    case code = 200
    case failure = 400
    
    var value: Int {
        return self.rawValue
    }
}

enum NetworkResponseStatus: String {
    case success = "OK"
    
    var value: String {
        return self.rawValue
    }
}

