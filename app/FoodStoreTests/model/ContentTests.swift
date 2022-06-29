//
//  ContentTests.swift
//  FoodStoreTests
//
//  Created by Maxik on 25.06.2022.
//

import XCTest

class ContentTests: XCTestCase {
    func testDecodeFirst() throws {
        var list: [Content] = loadJson("content.mock.json")
        
        XCTAssertEqual("123", list[0].id)
        XCTAssertEqual("124", list[1].id)
        XCTAssertEqual("125", list[2].id)
        XCTAssertEqual("126", list[3].id)
    }
    
    func testSlug() {
        var item = Content(
            _id: "123",
            tiemstamp: "123",
            created: "123",
            uniq: [ContentUniq(uniq: "SLUG", value: "VALUE")]
        )
        
        XCTAssertEqual("VALUE", item.slug)
    }
    
    func testName() {
        var item = Content(
            _id: "123",
            tiemstamp: "123",
            created: "123",
            property: [
                "DEF": [
                    "NAME": "VALUE"
                ]
            ]
        )
        
        XCTAssertEqual("VALUE", item.name)
    }
    
    func testPreviewImage() {
        var item = Content(
            _id: "123",
            tiemstamp: "123",
            created: "123",
            image: [
                "PREVIEW": [
                    ContentImage(url: "IMAGE")
                ]
            ]
        )
        
        XCTAssertEqual("IMAGE", item.previewImage)

    }
}
