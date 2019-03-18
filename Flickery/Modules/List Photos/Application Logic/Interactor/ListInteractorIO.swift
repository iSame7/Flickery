
//
//  ListInteractorIO.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    func getPhotos(_ limit: Int)
}

protocol ListInteractorOutput {
    func foundPhotos(_ photos: [Photo])
}
