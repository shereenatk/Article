//
//  ArticleViewModel.swift
//  Popular Article
//
//  Created by Development  on 25/08/2021.
//

import Foundation
import Alamofire

class ArticleListViewModel {
    fileprivate let client = BaseAPIClient()
    var responseStatus: ArticleModel?
    let paramDict = [
        "api-key": AppConstants.apiKey
                 ]
    var requestVal: URLRequestConvertible?
    func getArticleList( onCompletion: @escaping (_ isSuccess: Bool, _ errorMessage: (ResponseError?)) -> Void) {
        
        requestVal = PageRouter.getArticleList(paramDict)
        client.makeNetworkRequest(requestObj: PageRouter.getArticleList(paramDict))  { (response: ArticleModel?, error) in
                    if let error = error { DispatchQueue.main.async {onCompletion(false, error)}; return }
            self.responseStatus = response
           
             DispatchQueue.main.async {onCompletion(false, nil)}
                return
        }
    }
    
}
