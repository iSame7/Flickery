//
//  ListViewTests.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 06/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import XCTest
@testable import Flickery

class ListViewTests: XCTestCase {
    
    // system under test
    var sut: ListPhotosCollectionViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        sut = storyboard.instantiateViewController(withIdentifier: ListViewControllerIdentifier) as! ListPhotosCollectionViewController
        sut.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShowPhotos() {
        sut.showPhotos([])
        XCTAssertEqual(sut.view, sut.collectionView, "the collection view should be the view")
    }
    
}
