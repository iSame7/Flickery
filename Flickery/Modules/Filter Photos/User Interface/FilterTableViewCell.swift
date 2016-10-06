//
//  FilterTableViewCell.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit
import Nuke

class FilterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            if let flickerPhoto = photo {
                // Setting labels
                
                if let name = flickerPhoto.title {
                    self.titleLabel.text = name
                }
                
                print("flickerPhoto.url \(flickerPhoto.url)")
                print("flickerPhoto.id \(flickerPhoto.id)")
                print("flickerPhoto.owner \(flickerPhoto.owner)")
                
                // Setting a remote image
                if let _ = flickerPhoto.id , let _ = flickerPhoto.owner{
                    
                    let url = URL(string: "https://farm" + String(flickerPhoto.farm) + ".staticflickr.com/" + flickerPhoto.server + "/" + flickerPhoto.id + "_"
                        + flickerPhoto.secret + ".jpg")
                    
                    //https://farm9.staticflickr.com/8764/29839520190_68b276839d.jpg
                    
//                    let url = URL(string: KFlicker_BaseImageURL + owner + "/" + path)

                    print("Image Path is<> \(url)")
                    
                    Nuke.loadImage(with: url!, into: self.photoImageView)

                }
                
            }
        }
    }
    
}
