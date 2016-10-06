//
//  ListPhotosCollectionViewController.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit
import SKPhotoBrowser

private let reuseIdentifier = "Cell"

class ListPhotosCollectionViewController: UICollectionViewController {

    
    // RightBarButton
    var rightBarButton: UIBarButtonItem?
    
    // array of photos.
    var photos = [Photo]()
    
    // limit that manges marvel number of resources loaded per request.
    var limit = KFlickerResourcesLimit
    
    // Event handler or Presenter
    var eventHandler:ListModuleInterface?
    
    var strongCollectionView: UICollectionView?
    
    /*
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.strongCollectionView = self.collectionView
        configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        print("ListPhotos")
        super.viewWillAppear(animated)
        
        eventHandler?.updateView(limit)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.tintColor = nil
        self.navigationController?.navigationBar.isTranslucent = true
        
        // Hide navigation bar while swip up, or show navigation bar while swip down.
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    func configureView() {
        
        // Change status bar style to light.
        UIApplication.shared.statusBarStyle = .lightContent
        
        self.title = "Flickery"
        
        // title view
//        self.navigationItem.titleView = UIImageView(image: UIImage(named: "icn-nav-marvel"))
        
        // Navigation item image.
        if var image = UIImage(named: "icn-nav-search") {
            // Use the always original rendering mode, if you don't want the navigation bar's tintColor property to effect your bar button's color.
            image = UIImage(named:"icn-nav-search")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            rightBarButton =  UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(ListPhotosCollectionViewController.searchPressed))
            self.navigationItem.rightBarButtonItem = rightBarButton
        }
        
        // background
        collectionView!.backgroundColor = UIColor.colorFromRGB(39, g: 43, b: 47)
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
        
        definesPresentationContext = true
    }
    
    // MARK: - Actions
    func searchPressed() {
        
        eventHandler?.searchPhotos()
        
        self.navigationItem.titleView?.isHidden = true
        self.navigationItem.rightBarButtonItem = nil
    }
}



extension ListPhotosCollectionViewController: ListViewInterface {
    
    func showPhotos(_ photos: [Photo]) {
    
        self.view = self.strongCollectionView
        self.photos = photos
        self.collectionView?.reloadData()
    }
}

extension ListPhotosCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count;
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellForItemAt..here")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlidingMenuCell", for: indexPath) as! SlidingMenuCell
        cell.photo = photos[indexPath.item]
//        
        if (indexPath.row == self.photos.count - 1) {
            
            // scrolling indicator at last item.
            
            // Increase resources limit.
            limit = limit + KFlickerResourcesLimit
            
            eventHandler?.updateView(limit)
        }
        
        return cell

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        eventHandler?.openDetailsView(indexPath.item, photos: self.photos)
    }
    
}

extension ListPhotosCollectionViewController: UISearchControllerDelegate {
    
    func didDismissSearchController(_ searchController: UISearchController) {
        self.navigationItem.titleView?.isHidden = false
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
}

