//
//  FlickeryAuthenticationTests.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 06/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import XCTest
@testable import Flickery

class FlickeryAuthenticationTests: XCTestCase {
    
    // SUT: stands for - System Under Test.
    var sut:FlickerFactory?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = FlickerFactory()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testURLParamsYieldKnownResult() {
        let urlParams:(String, String, String)? = sut?.URLParameters()
        assert(urlParams! == ("json", "e85c4d83dd667be8a90d827376483330", "1"), "url params is not well formated")
    }
    
    func testURLParamsIsNotNill() {
        let urlParams = sut?.URLParameters()
        assert(urlParams != nil, "url params is empty")
    }

    
}
