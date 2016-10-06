//
//  FilterViewInterface.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

// Defines the public interface that something else can use to drive the user interface
protocol FilterViewInterface {
    
    func showCharacters(_ photos: [Photo])
    
}
