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
                if let name = flickerPhoto.title {
                    self.titleLabel.text = name
                }
                if let _ = flickerPhoto.id , let _ = flickerPhoto.owner{                    
                    let url = URL(string: "https://farm" + String(flickerPhoto.farm) + ".staticflickr.com/" + flickerPhoto.server + "/" + flickerPhoto.id + "_"
                        + flickerPhoto.secret + ".jpg")
                    Nuke.loadImage(with: url!, into: self.photoImageView)

                }
                
            }
        }
    }
    
}
