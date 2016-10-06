//
//  ListViewInterface.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit

// Defines the public interface that something else can use to drive the user interface
protocol ListViewInterface {
    func showPhotos(_ photos: [Photo])
}
