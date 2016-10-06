//
//  FlickeryFactory.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation


class FlickeryFactory: FlickerGateway {
    
    // Constants
    let KFlickeryFactory_PhotosEndpoint                                   = "?method=flickr.photos.search"
    
    let KMarvelFactory_CharactersComicsEndpoint                             = "/comics"
    
    let KMarvelFactory_CharactersSeriesEndpoint                             = "/series"
    
    let KMarvelFactory_CharactersStoriesEndpoint                            = "/stories"
    
    let KMarvelFactory_CharactersEventsEndpoint                             = "/events"
    
    var timeStamp:String?
    
    var hash:String?
    
    var publicKey:String?
    
    var privateKey:String?
    
    
    // Shared Instance
//    let networkingManager:Networking = Networking.sharedInstance
    
    
    func getPublicKey() -> String?{
        if self.publicKey == nil {
            self.publicKey = KMarvelFactory_PublicKey
        }
        return self.publicKey
    }
    
    func getPrivateKey() -> String?{
        if self.privateKey == nil {
            self.privateKey = KMarvelFactory_PrivateKey
        }
        return self.privateKey
    }
}
