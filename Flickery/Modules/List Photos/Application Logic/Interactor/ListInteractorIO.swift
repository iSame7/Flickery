
//
//  ListInteractorIO.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getPhotos(_ limit: Int)
}

protocol ListInteractorOutput {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    func foundPhotos(_ photos: [Photo])
}
