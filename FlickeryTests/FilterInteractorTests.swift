//
//  FilterInteractorTests.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 06/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import XCTest
@testable import Flickery

class FilterInteractorTests: XCTestCase {
    
    // Mock ListPresenter Class
    class PresenterMock: FilterPresenter {
        
    }
    
    // Mock Factory class
    class FlickerlFactoryMock: FlickerFactory {
    }
    
    // SUT: stands for - System Under Test.
    var sut: FilterInteractor!
    var presenterMock: PresenterMock!
    var flickerFactoryMocked: FlickerlFactoryMock!
    
    let textToFilter = "Cat"
    let textToFilterSpecialChar = "~"
    let textToFilterEmptyString = ""
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        flickerFactoryMocked = FlickerlFactoryMock()
        
        sut = FilterInteractor(flickerGateway: flickerFactoryMocked)
        presenterMock = PresenterMock()
        sut.output = presenterMock
        presenterMock.filterInteractor = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        sut = nil
        presenterMock = nil
        flickerFactoryMocked = nil
    }
    /* text returned photos is not empty */
    func testFilterPhotos() {
        
        let asyncExpectation = expectation(description: "Filter Photos")
        
        sut.gateway!.filterPhotos(10, name: textToFilter, completionHandler: { (photos) in
        
            XCTAssertNotNil(photos, "filterd photos should not be nil")
            
            asyncExpectation.fulfill()

            }) { (error) in
                
        }
        waitForExpectations(timeout: 20) { (error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }
    /* test special characters in search text also simulate SQL Injection in search text */
    func testFilterPhotosForSpecialCharacters() {
        
        let asyncExpectation = expectation(description: "Filter Photos")
        
        sut.gateway!.filterPhotos(5, name: textToFilterSpecialChar, completionHandler: { (photos) in
            
            XCTAssertNotNil(photos, "filterd photos should not be nil")
            
            asyncExpectation.fulfill()
            
        }) { (error) in
            
        }
        waitForExpectations(timeout: 20) { (error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }
    /* test count of photos returned*/
    func testFilterPhotosCount() {
        
        let asyncExpectation = expectation(description: "Filter Photos")
        
        sut.gateway!.filterPhotos(5, name: textToFilterSpecialChar, completionHandler: { (photos) in
            
            assert(photos.count == 5, "Response doesn't contain 5 photos")
            
            asyncExpectation.fulfill()
            
        }) { (error) in
            
        }
        waitForExpectations(timeout: 20) { (error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }
    
    /* test that simulate user scrolling in UITableView */
    func testFilterPhotosInfinitScrolling() {
        
        let asyncExpectation = expectation(description: "Filter Photos")
        
        sut.gateway!.filterPhotos(5, name: textToFilterSpecialChar, completionHandler: { (photos) in
            
            var photoCount = photos.count
            self.sut.gateway!.filterPhotos(5, name: self.textToFilter, completionHandler: { (otherPhotos) in
                
                photoCount = photoCount + otherPhotos.count
                assert(photoCount == 10, "Response doesn't contain 10 photos")
                
                asyncExpectation.fulfill()
                
                }, failure: { (error) in
                    
            })
                
            
            
        }) { (error) in
            
        }
        waitForExpectations(timeout: 20) { (error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }
    
    /* test that simulate user typing empty text in search field */
    func testFilterPhotosForEmptyText() {
        
        let asyncExpectation = expectation(description: "Filter Photos")
        
        sut.gateway!.filterPhotos(5, name: textToFilterEmptyString, completionHandler: { (photos) in
            
            assert(photos.count == 0, "Response should not contain photos")
            
            asyncExpectation.fulfill()
            
        }) { (error) in
            
        }
        waitForExpectations(timeout: 20) { (error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }
    
}
