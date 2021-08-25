//
//  AppColor.swift
//  Popular Article
//
//  Created by Development  on 25/08/2021.
//

import UIKit
import Foundation

enum AppColor {
    case primaryColor
}

extension AppColor {
    var value: UIColor {
        var instanceColor = UIColor.clear
        switch self {
        case .primaryColor:
            instanceColor = UIColor(red: 0.35, green: 0.89, blue: 0.77, alpha: 1.00)
        }
        return instanceColor
    }
    
    var cgColor: CGColor {
        return self.value.cgColor
    }
}
  

