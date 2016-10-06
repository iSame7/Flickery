//
//  FilterPresenter.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit

class FilterPresenter: NSObject, ListInteractorOutput, FilterModuleInterface, UISearchControllerDelegate {
    
    var filterInteractor : FilterInteractor?
    var filterWireframe : FilterWireframe?
    var filterModuleDelegate : FilterModuleInterface?
    var userInterface : FilterViewInterface?
    
    func updateView(_ limit: Int, name: String) {
        print("Limit in presenter \(limit)")
        filterInteractor?.getCharacters(limit, name: name)
    }
    
    func foundPhotos(_ photos: [Photo]) {
        if photos.count > 0 {
            userInterface?.showCharacters(photos)
        }
    }
    
    func tableViewCellSelected(_ selectedCellIndex: Int, photos: [Photo]) {
        // Ask wireframe to navigate to MarvelHeroesDetailsTableViewController.
        filterWireframe?.PresentDetailsInterface(selectedCellIndex, photos: photos)
    }
}
