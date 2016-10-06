//
//  FlickerGateway.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

/**
 This prtocol is made to acheive the Dependency Inversion Principle - the D of SOLID.The classic way to invert a dependency is to extract a protocol. (when you see “protocol,” think “interface.”) We’ll call it the Flicker Gateway.
 To make our API service layer more ignorant about most of the app, it has to implement the marvel gateway protocol. The prtocol act as a contract.
 Thanks to Dependency Inversion, the rest of the app can now be ignorant. It knows about the contract, but not about any class that satisfies that contract.
 Anything that implements the protocol can be plugged in. The Marvel Gateway serves as a Boundary.
 */
protocol FlickerGateway {
    
    // filter characters by name
    func filterPhotos(_ limitPerPage: Int, name: String, completionHandler: @escaping (_ photos: [Photo]) -> Void, failure: @escaping (_ error: Error?) -> Void)
    // Returns the list of interesting photos for the most recent day or a user-specified date.
    func getInterestingnessPhotoList(_ limitPerPage: Int, completionHandler: @escaping (_ photos: [Photo]) -> Void, failure: @escaping (_ error: Error?) -> Void)
}
