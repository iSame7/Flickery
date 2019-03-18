//
//  FilterCharactersTableViewController.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit
import SKPhotoBrowser

class FilterPhotosTableViewController: UITableViewController {
    var eventHandler : FilterModuleInterface?
    var limit = KFlickerResourcesLimit
    var photos = [Photo]()
    var searchText: String?
    var downloading: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloading = false
        
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Hide navigation bar while swip up, or show navigation bar while swip down.
        navigationController?.hidesBarsOnSwipe = false
        
    }
    func configureView() {
        tableView.backgroundColor = UIColor.colorFromRGB(39, g: 43, b: 47)
        
        /*
         Table views show separators between empty rows by default, which looks quite strange when you have only a handful of visible rows.
         What's actually happening is that you're creating an empty UIView and making it act as the footer of the table – this is the bottom most thing visible in the table. When iOS reaches the bottom of the cells you provide, it draws this view at the end rather than drawing empty rows and their separators, so it totally clears up the problem.
         */
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:FilterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FilterCell") as! FilterTableViewCell
        cell.photo = self.photos[indexPath.row]
        
        let lastElement = self.photos.count - 1
        if indexPath.row == lastElement {
            limit = limit + KFlickerResourcesLimit
            self.eventHandler?.updateView(limit, name: self.searchText!)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.eventHandler?.tableViewCellSelected(indexPath.row, photos: self.photos)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension FilterPhotosTableViewController: UISearchResultsUpdating {
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            if searchText != "" {
                
                self.searchText = searchText
                
                self.eventHandler?.updateView(limit, name: searchText)
            }
        }
    }
}

// MARK: - UISearchBarDelegate
extension FilterPhotosTableViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}

extension FilterPhotosTableViewController: FilterViewInterface {
    
    func showCharacters(_ photos: [Photo]) {
        print("showCharacters")
        
        self.photos = photos
        print("photoes count: \(self.photos.count)")
        
        self.tableView?.reloadData()
        self.downloading = false
        
    }
}
