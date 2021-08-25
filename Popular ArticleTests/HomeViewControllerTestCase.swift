//
//  HomeViewControllerTestCase.swift
//  Popular ArticleTests
//
//  Created by User on 25/08/2021.
//

import XCTest
@testable import Popular_Article
class HomeViewControllerTestCase: XCTestCase {
   
    func test_setsTableView() {
           let homeListViewCountroller = createSUT()
           
           _ = homeListViewCountroller.view
           
           XCTAssertNotNil(homeListViewCountroller.homeTableView)
       }
       
       private func createSUT() -> HomeViewController {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           return storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
       }
    var viewControllerUnderTest: HomeViewController!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.homeTableView)
    }

    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.homeTableView.delegate)
    }

    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:didSelectRowAt:))))
    }

    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.homeTableView.dataSource)
    }

    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

    func testTableViewCellHasReuseIdentifier() {
        let actualReuseIdentifer = viewControllerUnderTest.cellReusableId
        let expectedReuseIdentifier = "HomeTVCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }

    func testTableViewHeightForRowAtIndexPath() {
        let expectedHeight: CGFloat = 44.0
        let actualHeight = viewControllerUnderTest.homeTableView.rowHeight
        XCTAssertNotEqual(expectedHeight, actualHeight)
    }
    func testTableViewOutlet() {
           XCTAssertNotNil(viewControllerUnderTest.homeTableView)
       }

//    func test_rowShowsCorrectCountry() {
//           let row = [Result(uri: "test", url: "test", id: 1, assetID: 1, source: "test", publishedDate: "test", updated: "test", section: "test", subsection: "test", nytdsection: "test", adxKeywords: "test", byline: "test", type: "test", title: "test", abstract: "test", desFacet: ["test"], orgFacet: ["test"], perFacet: ["test"], geoFacet: ["test"], media: [Media(type: "test", subtype: "test", caption: "test", copyright: "test", approvedForSyndication: 1, mediaMetadata: [MediaMetadatum(url: "test", format: "test", height: 1, width: 1)])], etaID: 1)]
//           let sut = homeDataSource(home: home)
//
//           let tablewView = UITableView()
//           tablewView.dataSource = sut
//           tablewView.reloadData()
//
//           let cell = tablewView.cellForRow(at: IndexPath(row: 0, section: 0))
//
//           XCTAssertEqual("Greece", cell?.textLabel?.text)
//       }
    
}
