//
//  FlickerFactory.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation


class FlickerFactory: FlickerGateway {
    
    // Constants
    let KFlickerFactory_PhotosSearchEndpoint                                = "flickr.photos.search"
    
    let KFlickerFactory_getInterestingssEndpoint                            = "flickr.interestingness.getList"
    
    let KFlickerFactory_PhotoEndpoint                                       = "flickr.photos.getInfo"
    
    // Vars
    var publicKey:String?
    
    var format:String?
    
    var callBack:String?

    func getPublicKey() -> String?{
        if self.publicKey == nil {
            self.publicKey = KFlickeryFactory_APIKey
        }
        return self.publicKey
    }
    
    func getAPIResposeFormat() -> String?{
        if self.format == nil {
            self.format = APIResposeFormate
        }
        return self.format
    }
    
    func getAPJsonCallback() -> String?{
        if self.callBack == nil {
            self.callBack = APIJSONCallback
        }
        return self.callBack
    }
    
    /**
     Get url parameters that consists of apikey and formate
     
     - returns: url parameters as tuple grouping multiple values(ts, apiKey, hash) into a single compound value (URLParameters).
     */
    func URLParameters() -> (String, String, String)?  {
        
        guard let apiKey = self.getPublicKey()
            else {
                return nil
        }
        
        guard let format = self.getAPIResposeFormat()
            else {
                return nil
        }
        
        guard let jsonCallback = self.getAPJsonCallback()
            else {
                return nil
        }
        
        return (format, apiKey, jsonCallback)
    }

}
