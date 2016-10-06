//
//  SlidingMenuCell.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit
import Nuke

/**
 SlidingMenuCell is a subclass of UICollectionViewCell that is used for displaying rows in a RPSlidingMenuViewController.  It has a textLabel that can be set to show a header title for the cell.  It also has a detailTextLabel where a longer description can follow the textLabel header.  The backgroundImageView allows an image to be set behind it.  This cell has text that fades and shrink as it goes from feature height to normal height
 */
class SlidingMenuCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var imageCoverView: UIView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var timeAndRoomLabel: UILabel!
    @IBOutlet fileprivate weak var speakerLabel: UILabel!

    
    var photo: Photo? {
        didSet {
            if let flickerPhoto = photo {
                // Setting labels
                
                
                print("flickerPhoto.url \(flickerPhoto.url)")
                print("flickerPhoto.id \(flickerPhoto.id)")
                print("flickerPhoto.owner \(flickerPhoto.owner)")
                
                // Setting a remote image
                if let _ = flickerPhoto.id , let _ = flickerPhoto.owner{
                    
                    let url = URL(string: "https://farm" + String(flickerPhoto.farm) + ".staticflickr.com/" + flickerPhoto.server + "/" + flickerPhoto.id + "_"
                        + flickerPhoto.secret + ".jpg")
                    
                    //https://farm9.staticflickr.com/8764/29839520190_68b276839d.jpg
                    
                    print("Image Path is<> \(url)")
                    
                    Nuke.loadImage(with: url!, into: self.imageView)
                    
                }
                
            }
        }
    }
 

}
