//
//  ListModuleInterface.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

protocol ListModuleInterface {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func updateView(_ limit: Int)
    
    func searchPhotos()
    
    func openDetailsView(_ selectedCellIndex: Int, photos: [Photo])
}
