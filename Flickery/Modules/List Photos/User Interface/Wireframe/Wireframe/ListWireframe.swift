//
//  ListWireframe.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit
import SKPhotoBrowser

/***
 Routes from one screen to another are defined in the wireframes created by an interaction designer. In VIPER, the responsibility for Routing is shared between two objects: the Presenter, and the wireframe. A wireframe object owns the UIWindow, UINavigationController, UIViewController, etc. It is responsible for creating a View/ViewController and installing it in the window.
 */

let ListViewControllerIdentifier = "ListViewController"

class ListWireframe: NSObject {
//    var detailsWireframe : DetailsWireframe?
    var filterWireframe : FilterWireframe?
    var listPresenter : ListPresenter?
    var rootWireframe : RootWireframe?
    var listViewController : ListPhotosCollectionViewController?
    
    func presentListInterfaceFromWindow(_ window: UIWindow) {
        let viewController = listViewControllerFromStoryboard()
        viewController.eventHandler = listPresenter
        listViewController = viewController
        
        listPresenter?.userInterface = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    func presentFilterInterface() {
        filterWireframe?.presentFilterInterfaceFromViewController(listViewController!)
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
    
    func listViewControllerFromStoryboard() -> ListPhotosCollectionViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: ListViewControllerIdentifier) as! ListPhotosCollectionViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
}
