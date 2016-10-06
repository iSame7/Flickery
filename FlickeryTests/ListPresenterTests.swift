//
//  ListPresenterTests.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 06/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import XCTest
@testable import Flickery

class ListPresenterTests: XCTestCase {
    
    // create a hand rolled mock. In swift this is a little bit less painful since you can create inner classes within a method, but still is not as handy as a mocking framework.
    
    // Mock Factory class
    class ListWireframeMock: ListWireframe {
        
        // This variable to achieve the XCTest expect method like OCMock framework expect method.
        var presentFilterInterfaceWasCalled = false
        
        override func presentFilterInterface() {
            presentFilterInterfaceWasCalled = true
        }
        override func PresentDetailsInterface(_ selectedCellIndex: Int, photos: [Photo]) {
            presentFilterInterfaceWasCalled = true
        }
    }
    
    // Mock Factory class
    class ListCharactersViewControllerMock: ListViewInterface {
        
        // This variable to achieve the XCTest expect method like OCMock framework expect method.
        var showPhotosWasCalled = false
        
        func showPhotos(_ photos: [Photo]) {
            print("showPhotosWasCalled...")
            showPhotosWasCalled = true
        }
    }

    var sut: ListPresenter!
    var ui: ListCharactersViewControllerMock!
    var listWireframeMocked: ListWireframeMock!
    
    var photos:[Photo] = []

    override func setUp() {
        super.setUp()
        
        ui = ListCharactersViewControllerMock()
        
        listWireframeMocked = ListWireframeMock()
        
        sut = ListPresenter()
        sut.userInterface = ui
        sut.listWireframe = listWireframeMocked
        
        // Parse the local test json data as Array of Character dictionaries.
        if let characterJsonFileURL = Bundle(for: type(of: self)).url(forResource: "Interestingness", withExtension: "json") {
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
    
    func testSearchPhotosActionPresentsFilterUI() {
        
        // Test
        sut.searchPhotos()
        
        // Verify
        XCTAssertTrue(listWireframeMocked.presentFilterInterfaceWasCalled)
    }
    
    func testFoundPhotos() {
        
        // Test
        sut.foundPhotos(photos)
        
        // Verify
        XCTAssertTrue(ui.showPhotosWasCalled)
    }
    
    func testOpenDetailsViewActionPresentsDetailsUI() {
        
        // Test
        sut.openDetailsView(1, photos: photos)
        
        // Verify
        XCTAssertTrue(listWireframeMocked.presentFilterInterfaceWasCalled)
    }
    
}
