//
//  ListInteractor.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation


/*
 An Interactor represents a single use case in the app. It contains the business logic to manipulate model objects (Entities) to carry out a specific task. The work done in an Interactor should be independent of any UI.
 */
class ListInteractor: NSObject, ListInteractorInput {
    
    var output:ListInteractorOutput?
    
    // Gateway that is our abstraction for all operation of getting data from network.
    var gateway:FlickerGateway?

    init<T:FlickerGateway>(flickergateway: T) {
        self.gateway = flickergateway
    }
    
    // MARK: - ListInteractorInput implementation
    
    func getPhotos(_ limit: Int) {
    
        self.gateway?.getInterestingnessPhotoList(limit, completionHandler: { (photos) in
            
            self.output?.foundPhotos(photos)

            }, failure: { (error) in
                
        })
        
 
    }
    
}
