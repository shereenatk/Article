//
//  DetailedViewControllerTestCase.swift
//  Popular ArticleTests
//
//  Created by User on 26/08/2021.
//

import XCTest
@testable import Popular_Article
class DetailedViewControllerTestCase: XCTestCase {
    var viewControllerUnderTest: DetailsViewController!
    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    func testIfShareButtonClicked() {
        let shareButton: UIButton = viewControllerUnderTest.shareButton
        XCTAssertNotNil(shareButton, "View Controller does not have UIButton property")
        guard let shareButtonActions = shareButton.actions(forTarget: viewControllerUnderTest, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(shareButtonActions.contains("sharePdf:"))
    }
    
    func testIfEyeButtonClicked() {
        let eyeButton: UIButton = viewControllerUnderTest.eyebutton
        XCTAssertNotNil(eyeButton, "View Controller does not have UIButton property")
        guard let shareButtonActions = eyeButton.actions(forTarget: viewControllerUnderTest, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(shareButtonActions.contains("openPdfInSafari:"))
    }
  
}
