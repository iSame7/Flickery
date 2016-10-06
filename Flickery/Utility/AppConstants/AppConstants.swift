//
//  AppConstants.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit

// Slid Menu Layout constants

/* The heights are declared as constants outside of the class so they can be easily referenced elsewhere */

/* The height of the first visible cell */
let SlidingCellFeatureHeight: CGFloat           = 280
/* The height of the non-featured cell */
let SlidingCellCollapsedHeight: CGFloat         = 100
let SlidingMenuNormalImageCoverAlpha: CGFloat   = 0.5
let SlidingMenuFeaturedImageCoverAlpha: CGFloat = 0.2

/* Environment */
let kFlickerAPIClient_BaseURL                    = "https://api.flickr.com/services/rest/"

let kMarvelAPIVersion                           = "/v1"


/* ListCharachters constants */
// Count of flicker resources to load for first request.
let KFlickerResourcesLimit                       = 20

/* Flicker API keys */
let KFlickeryFactory_APIKey:String             = "e85c4d83dd667be8a90d827376483330"

let KFlickeryFactory_APISecret:String            = "6c40ac98183b4be7"

let APIResposeFormate:String = "json"

let APIJSONCallback:String = "1"

let KFlicker_BaseImageURL: String = "https://www.flickr.com/photos/"

