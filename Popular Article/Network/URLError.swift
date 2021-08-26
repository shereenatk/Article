//
//  URLError.swift
//  Popular Article
//
//  Created by User on 26/08/2021.
//

import Foundation
fileprivate extension String {
    static let invalidURL = "URL is not valid"
}
enum URLError: Error {
    
    case urlMalformatted
    var value: String {
        switch self {
        case .urlMalformatted:
            return .invalidURL
        }
    }
}
