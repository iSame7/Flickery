//
//  FilterModuleInterface.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

protocol FilterModuleInterface {
    func tableViewCellSelected(_ selectedCellIndex: Int, photos: [Photo])
    func updateView(_ limit: Int, name: String)
}
