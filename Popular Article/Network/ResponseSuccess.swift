//
//  ResponseSuccess.swift
//  Popular Article
//
//  Created by Development  on 25/08/2021.
//

import Foundation
open class ResponseSuccess: NSObject {
    open var URLRequest: URLRequest?
    open var URLResponse: URLResponse?
    open var data: Data?
    open var JSON: Any?
    open var error: ResponseError?
    open var statusCode: Int = 0
    open var success: Bool {
        return error == nil && (statusCode == 200 || statusCode == 201)
    }
    public init(URLRequest: URLRequest?, response: URLResponse?) {
        super.init()
        self.URLRequest = URLRequest
        self.URLResponse = response
    }
}
