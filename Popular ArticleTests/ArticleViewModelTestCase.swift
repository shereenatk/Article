//
//  ArticleViewModelTestCase.swift
//  Popular ArticleTests
//
//  Created by Development  on 25/08/2021.
//

import XCTest
@testable import Popular_Article

class ArticleViewModelTestCase: XCTestCase {
    let articleListVM = ArticleListViewModel()
    override func setUp() {
           super.setUp()
       }

   override func tearDown() {
       super.tearDown()
   }
    
    func testParameterToApi() {
        let parameter = [
            "api-key": AppConstants.apiKey
                     ]
        XCTAssertEqual(articleListVM.paramDict, parameter)
    }
    
    func testRequestToApi() {
        articleListVM.getArticleList { isSuccess, errorMessage  in
            let url =  "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=DGPl4MdyyVYPGGgX1vMA95A9A3FGGXRG"
            XCTAssertEqual(self.articleListVM.requestVal?.urlRequest?.url?.path, url)
        }
    }
    
    func testApiSuccessReturnsList() {
        articleListVM.getArticleList { isSuccess, errorMessage  in
            XCTAssertNotNil(self.articleListVM.responseStatus)
            XCTAssertNil(errorMessage)
      }
    }
    
}
