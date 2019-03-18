//
//  Networking.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import Foundation

import Alamofire

final class Networking {
    static let sharedInstance:Networking = Networking()
}

enum Router: URLRequestConvertible {
    static let baseURLString = kFlickerAPIClient_BaseURL

    case filterPhotos(endpoint:String, text:String, limit:String , urlParams:(String, String, String))
    case getInterestingness(endpoint:String, limit:String , urlParams:(String, String, String))
    
    var method: HTTPMethod {
        switch self {
        case .filterPhotos:
            return .get
        case .getInterestingness:
            return .get
        }
        
    }
    
    var parameters: [String: AnyObject]? {
        switch self {
        
        case .filterPhotos(let endpoint, let text, let limit, (let format,  let apiKey, let jsonCallback)):
            let params = ["method":endpoint, "api_key": apiKey, "text": text, "format": format, "per_page":limit, "nojsoncallback": jsonCallback]
            print("Request param: \(params)")

            return params as [String : AnyObject]?
            
        case .getInterestingness(let endpoint, let limit, (let format,  let apiKey, let jsonCallback)):
            let params = ["method":endpoint, "api_key": apiKey, "format": format, "per_page":limit, "nojsoncallback": jsonCallback]
            print("Request param: \(params)")
            
            return params as [String : AnyObject]?
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        
        return urlRequest
    }

    
}
