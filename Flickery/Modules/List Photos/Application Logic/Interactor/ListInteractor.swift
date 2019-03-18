//
//  ListInteractor.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

class ListInteractor: NSObject, ListInteractorInput {
    
    var output:ListInteractorOutput?
    
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
