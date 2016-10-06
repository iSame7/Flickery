//
//  ListInteractorTests.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 06/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import XCTest
@testable import Flickery

class ListInteractorTests: XCTestCase {
    
    // Mock ListPresenter Class
    class PresenterMock: ListPresenter {
        
    }
    
    // Mock Factory class
    class FlickeryFactoryMock: FlickerFactory {
        
    }
    
    // SUT: stands for - System Under Test.
    var sut: ListInteractor!
    var presenterMock: PresenterMock!
    var flickeryFactoryMocked: FlickeryFactoryMock!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        flickeryFactoryMocked = FlickeryFactoryMock()
        
        sut = ListInteractor(flickergateway: flickeryFactoryMocked)
        presenterMock = PresenterMock()
        sut.output = presenterMock
        presenterMock.listInteractor = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        sut = nil
        presenterMock = nil
        flickeryFactoryMocked = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testListInterestingnessPhoto() {
     
        let asyncExpectation = expectation(description: "Get Photot List")
        
        sut.gateway?.getInterestingnessPhotoList(10, completionHandler: { (photos) in
            
            
            XCTAssertNotNil(photos, "photos should not be nil")
            
            asyncExpectation.fulfill()
            
            }, failure: { (error) in
                
        })
        waitForExpectations(timeout: 20) { (error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }
}
