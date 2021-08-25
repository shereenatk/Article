//
//  ArticleModelTestCase.swift
//  Popular ArticleTests
//
//  Created by Development  on 25/08/2021.
//

import XCTest
@testable import Popular_Article
class ArticleModelTestCase: XCTestCase {
    func ArticleModel_canCreateInstance() {
        let instanceMediaMetadata = MediaMetadatum(
            url: "https://static01.nyt.com/images/2021/08/03/well/03Well-DeltaNow1/03Well-DeltaNow1-thumbStandard.jpg",
            format: "Standard Thumbnail",
            height: 75,
            width: 75
        )
        
        let instanceMedia = Media(type: "image",
                                  subtype: "photo",
                                  caption: "photo",
                                  copyright: "Getty Images",
                                  approvedForSyndication: 1,
                                  mediaMetadata: [instanceMediaMetadata])
        
        let instanceResult = Result(uri: "nyt://article/827d5ecf-0e5a-5f7d-a5c1-71654a53be4a",
                                    url: "https://www.nytimes.com/2021/08/03/well/live/covid-delta-variant-vaccine-symptoms.html",
                                    id: 100000007900001,
                                    assetID: 100000007900001,
                                    source: "New York Times",
                                    publishedDate: "2021-08-03",
                                    updated: "2021-08-05 11:33:35",
                                    section: "Well",
                                    subsection: "Live",
                                    nytdsection: "well",
                                    adxKeywords:  "Coronavirus Risks and Safety",
                                    byline: "By Tara Parker-Pope",
                                    type: "Article",
                                    title: "Should I Mask? ",
                                    abstract: "The rise of the Delta variant of the coronavirus",
                                    desFacet: [
                                        "Coronavirus Risks and Safety Concerns",
                                        "Content Type: Service"],
                                    orgFacet:  [
                                        "Coronavirus Risks and Safety Concerns",
                                        "Content Type: Service"]
                                    , perFacet:  [
                                        "Coronavirus Risks and Safety Concerns",
                                        "Content Type: Service"],
                                     geoFacet:  [
                                        "United States"
                                    ],
                                     media: [instanceMedia],
                                     etaID: 2)
        let instance = ArticleModel(status: "OK",
                                    copyright: "Copyright (c) 2021 The New York Times Company",
                                    numResults: 20, results: [instanceResult])
        
        XCTAssertNotNil(instance)
                                    
    }
}
