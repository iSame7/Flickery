//
//  UIColor+Palette.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorFromRGB(_ r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(red: CGFloat(Float(r) / 255), green: CGFloat(Float(g) / 255), blue: CGFloat(Float(b) / 255), alpha: 1)
    }
    
    class func palette() -> [UIColor] {
        let palette = [
            UIColor.colorFromRGB(85, g: 0, b: 255),
        ]
        return palette
    }
    
    /* ColorPalette is enum act as a palette that contain multiple colors to choose color from. */
    enum ColorPalette {
        case green
        case blue
        
        var colorValue: UIColor {
            switch self {
            case .green:
                return UIColor.colorFromRGB(85, g: 0, b: 255)
            case .blue:
                return UIColor.colorFromRGB(170, g: 0, b: 170)
            }
            
        }
    }
    
}
