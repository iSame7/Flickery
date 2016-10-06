//
//  FilterPresenterTests.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 06/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import XCTest
@testable import Flickery

class FilterPresenterTests: XCTestCase {
    
    // create a hand rolled mock. In swift this is a little bit less painful since you can create inner classes within a method, but still is not as handy as a mocking framework.
    
    // Mock Factory class
    class ListWireframeMock: FilterWireframe {
        
        // This variable to achieve the XCTest expect method like OCMock framework expect method.
        var presentFilterInterfaceWasCalled = false
        
        override func PresentDetailsInterface(_ selectedCellIndex: Int, photos characters: [Photo]) {
            presentFilterInterfaceWasCalled = true
        }
    }
    
    // Mock Factory class
    class FilterCharactersTableViewControllerMock: FilterViewInterface {
        
        // This variable to achieve the XCTest expect method like OCMock framework expect method.
        var showPhotosWasCalled = false
        
        func showCharacters(_ photos: [Photo]) {
            
            showPhotosWasCalled = true
        }
    }
    
    var sut: FilterPresenter!
    var ui: FilterCharactersTableViewControllerMock!
    var listWireframeMocked: ListWireframeMock!
    
    var photos:[Photo] = []
    
    override func setUp() {
        super.setUp()
        
        ui = FilterCharactersTableViewControllerMock()
        
        listWireframeMocked = ListWireframeMock()
        
        sut = FilterPresenter()
        sut.userInterface = ui
        sut.filterWireframe = listWireframeMocked
        
        // Parse the local test json data as Array of Character dictionaries.
        if let characterJsonFileURL = Bundle(for: type(of: self)).url(forResource: "Photos", withExtension: "json") {
            XCTAssertNotNil(characterJsonFileURL)
            
            if let data = NSData(contentsOf: characterJsonFileURL), let langDictionary = (try? JSONSerialization.jsonObject(with: data as Data, options: [])) as? NSDictionary{
                
                let rootClass:RootClass = RootClass(fromDictionary: langDictionary)
                photos = rootClass.photos.photo
            }
            
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFoundCharacters() {
        
        // Test
        sut.foundPhotos(photos)
        
        // Verify
        XCTAssertTrue(ui.showPhotosWasCalled)
    }
    
    func testTableViewCellSelectedActionPresentsDetailsUI() {
        
        // Test
        sut.tableViewCellSelected(1, photos: photos)
        
        // Verify
        XCTAssertTrue(listWireframeMocked.presentFilterInterfaceWasCalled)
    }
    
}
