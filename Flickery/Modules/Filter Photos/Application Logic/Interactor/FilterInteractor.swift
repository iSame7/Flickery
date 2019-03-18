//
//  FilterInteractor.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

class FilterInteractor: NSObject, FilterInteractorInput {
    
    var output: ListInteractorOutput?
    
    var gateway:FlickerGateway?

    init<T:FlickerGateway>(flickerGateway: T) {
        self.gateway = flickerGateway
    }
    
    func getCharacters(_ limit: Int, name: String) {
    
        self.gateway!.filterPhotos(limit, name: name, completionHandler: { (photos) in
            self.output?.foundPhotos(photos)
        }) { (error) -> Void in
        }
 
    } 
}
