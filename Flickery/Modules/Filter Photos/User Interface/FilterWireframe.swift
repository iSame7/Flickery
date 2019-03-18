//
//  FilterWireframe.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation
import UIKit
import SKPhotoBrowser

let FilterCharactersTableViewControllerIdentifier = "FilterCharacters"

class FilterWireframe: NSObject {
    var filterPresenter : FilterPresenter?
    var listViewController : ListPhotosCollectionViewController?
    
    func presentFilterInterfaceFromViewController(_ viewController: UIViewController) {
        
        listViewController = viewController as? ListPhotosCollectionViewController
        
        let searchResultsController = filterCharactersTableViewController()
        searchResultsController.eventHandler = filterPresenter
        filterPresenter?.userInterface = searchResultsController
        
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = searchResultsController
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchController.delegate = listViewController
        searchController.dimsBackgroundDuringPresentation = true
        viewController.present(searchController, animated: true, completion: nil)
    }
    
    func PresentDetailsInterface(_ selectedCellIndex: Int, photos: [Photo]) {
        
        // 1. create URL Array
        var images = [SKPhoto]()
        for image in photos {
            
            let path = "https://farm" + String(image.farm) + ".staticflickr.com/" + image.server + "/"
                + image.id + "_"
                + image.secret
            
            let photo = SKPhoto.photoWithImageURL(path + ".jpg")
            photo.caption = image.title
            photo.shouldCachePhotoURLImage = false // you can use image cache by true(NSCache)
            images.append(photo)
        }
        
        
        // 2. create PhotoBrowser Instance, and present.
        SKPhotoBrowserOptions.enableZoomBlackArea    = true  // default true
        SKPhotoBrowserOptions.enableSingleTapDismiss = true  // default false
        SKPhotoBrowserOptions.bounceAnimation        = true  // default false
        let browser = SKPhotoBrowser(photos: images)
        browser.initializePageIndex(selectedCellIndex)
        listViewController?.present(browser, animated: true, completion: {})

    }
    
    func filterCharactersTableViewController() -> FilterPhotosTableViewController {
        let storyboard = mainStoryboard()
        let addViewController: FilterPhotosTableViewController = storyboard.instantiateViewController(withIdentifier: FilterCharactersTableViewControllerIdentifier) as! FilterPhotosTableViewController
        return addViewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
}
