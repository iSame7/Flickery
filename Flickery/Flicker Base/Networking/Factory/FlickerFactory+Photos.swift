
//
//  FlickerFactory+Photos.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

import Alamofire

extension FlickerFactory{

    
    func filterPhotos(_ limitPerPage: Int, name: String, completionHandler: @escaping (_ photos: [Photo]) -> Void, failure: @escaping (_ error: Error?) -> Void){

        if let urlParams = self.URLParameters() {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
                Alamofire.request(Router.filterPhotos(endpoint: KFlickerFactory_PhotosSearchEndpoint , text: name, limit: String(limitPerPage), urlParams: urlParams)).responseJSON { result in
                    print("Result <> : \(result)")
                switch result.result {
                case .success(let data):
                    
                    if let JSON: AnyObject = data as AnyObject? {
                        if let jsonDict: NSDictionary = JSON as? NSDictionary {
                            guard let status:String = jsonDict["stat"] as? String , status == "ok" else {
                                completionHandler([])
                                break
                            }
                            
                            let rootClass:RootClass = RootClass(fromDictionary: jsonDict)
                            completionHandler(rootClass.photos.photo)
                        }
                        else{
                        }
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    failure(error)
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }

    }
    
    func getInterestingnessPhotoList(_ limitPerPage: Int, completionHandler: @escaping ([Photo]) -> Void, failure: @escaping (Error?) -> Void) {
        if let urlParams = self.URLParameters() {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            Alamofire.request(Router.getInterestingness(endpoint: KFlickerFactory_getInterestingssEndpoint, limit: String(limitPerPage), urlParams: urlParams)).responseJSON { result in
                print("Result <> : \(result)")
                switch result.result {
                case .success(let data):
                    
                    if let JSON: AnyObject = data as AnyObject? {
                        //print("JSON: \(JSON)")
                        // Get json as Dictionary to be parsed.
                        if let jsonDict: NSDictionary = JSON as? NSDictionary {
                            let rootClass:RootClass = RootClass(fromDictionary: jsonDict)
                            completionHandler(rootClass.photos.photo)
                        }
                        else{
                        }
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    failure(error)
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    
}
