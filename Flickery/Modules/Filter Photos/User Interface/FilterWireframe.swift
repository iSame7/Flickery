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

/***
 Routes from one screen to another are defined in the wireframes created by an interaction designer. In VIPER, the responsibility for Routing is shared between two objects: the Presenter, and the wireframe. A wireframe object owns the UIWindow, UINavigationController, UIViewController, etc. It is responsible for creating a View/ViewController and installing it in the window.
 */

let FilterCharactersTableViewControllerIdentifier = "FilterCharacters"

class FilterWireframe: NSObject {
    
//    var detailsWireframe : DetailsWireframe?
    var filterPresenter : FilterPresenter?
    var listViewController : ListPhotosCollectionViewController?
    
    func presentFilterInterfaceFromViewController(_ viewController: UIViewController) {
        
        listViewController = viewController as? ListPhotosCollectionViewController
        
        let searchResultsController = filterCharactersTableViewController()
        searchResultsController.eventHandler = filterPresenter
        filterPresenter?.userInterface = searchResultsController
        
        // Init UISearchController with the search results controller
        let searchController = UISearchController(searchResultsController: searchResultsController)
        // Link the search controller
        searchController.searchResultsUpdater = searchResultsController
        // This is obviously needed because the search bar will be contained in the navigation bar
        searchController.hidesNavigationBarDuringPresentation = true
        // Required (?) to set place a search bar in a navigation bar
        searchController.searchBar.searchBarStyle = UISearchBarStyle.prominent
        // This is where you set the search bar in the navigation bar, instead of using table view's header ...
        //        self.navigationItem.titleView = searchController.searchBar
        // To ensure search results controller is presented in the current view controller
        //        searchController.definesPresentationContext = true
        
        searchController.delegate = listViewController
        searchController.dimsBackgroundDuringPresentation = true
        
        // This line do the trick of diplaying UISearchController using a button action and wothout SearchBar.
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
