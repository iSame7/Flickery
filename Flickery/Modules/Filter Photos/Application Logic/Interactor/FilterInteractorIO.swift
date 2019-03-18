
//
//  FilterInteractorIO.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

protocol FilterInteractorInput {
    func getCharacters(_ limit: Int, name: String)
}

protocol FilterInteractorOutput {
    func foundPhotos(_ characters: [Character])
}
