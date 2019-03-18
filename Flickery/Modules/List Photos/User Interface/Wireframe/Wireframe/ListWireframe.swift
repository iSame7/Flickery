//
//  ListWireframe.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit
import SKPhotoBrowser

let ListViewControllerIdentifier = "ListViewController"

class ListWireframe: NSObject {
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
        var images = [SKPhoto]()
        for image in photos {
            
            let path = "https://farm" + String(image.farm) + ".staticflickr.com/" + image.server + "/"
                + image.id + "_"
                + image.secret
            
            
            let photo = SKPhoto.photoWithImageURL(path + ".jpg")
            photo.caption = image.title
            photo.shouldCachePhotoURLImage = false
            images.append(photo)
        }
        
        SKPhotoBrowserOptions.enableZoomBlackArea    = true
        SKPhotoBrowserOptions.enableSingleTapDismiss = true
        SKPhotoBrowserOptions.bounceAnimation        = true
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
