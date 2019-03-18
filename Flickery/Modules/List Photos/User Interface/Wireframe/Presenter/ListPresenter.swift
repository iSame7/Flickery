
//
//  ListPresenter.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

class ListPresenter: NSObject, ListInteractorOutput, ListModuleInterface {
    
    var listInteractor : ListInteractorInput?
    var listWireframe : ListWireframe?
    var userInterface : ListViewInterface?
    
    func updateView(_ limit: Int) {
        listInteractor?.getPhotos(limit)
    }
    
    func searchPhotos() {
        listWireframe?.presentFilterInterface()
    }
    
    func foundPhotos(_ photos: [Photo]) {
        if photos.count > 0 {
            userInterface?.showPhotos(photos)
        }
    }
    
    func openDetailsView(_ selectedCellIndex: Int, photos: [Photo]) {
        listWireframe?.PresentDetailsInterface(selectedCellIndex, photos: photos)
    }
}
