//
//	Photo.swift
//
//	Create by Sameh Mabrouk on 5/10/2016
//	Copyright © 2016. All rights reserved.

import Foundation

struct Photo{

	var farm : Int!
	var id : String!
	var isfamily : Int!
	var isfriend : Int!
	var ispublic : Int!
	var owner : String!
	var secret : String!
	var server : String!
	var title : String!
	var page : Int!
	var pages : Int!
	var perpage : Int!
	var photo : [Photo]!
	var total : String!
    var url : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		farm = dictionary["farm"] as? Int
		id = dictionary["id"] as? String
		isfamily = dictionary["isfamily"] as? Int
		isfriend = dictionary["isfriend"] as? Int
		ispublic = dictionary["ispublic"] as? Int
		owner = dictionary["owner"] as? String
		secret = dictionary["secret"] as? String
		server = dictionary["server"] as? String
		title = dictionary["title"] as? String
		page = dictionary["page"] as? Int
		pages = dictionary["pages"] as? Int
		perpage = dictionary["perpage"] as? Int
		photo = [Photo]()
		if let photoArray = dictionary["photo"] as? [NSDictionary]{
			for dic in photoArray{
				let value = Photo(fromDictionary: dic)
				photo.append(value)
			}
		}
		total = dictionary["total"] as? String
        
        /*
        print("All Photos \(dictionary["photo"] as? [NSDictionary])")
        
        
        if let photoURLS = dictionary["photo"] as? [NSDictionary] {
            if let urlArr = photoURLS["url"] as? [NSDictionary] {
                print("All URLARR \(urlArr)")
                
                for dic in urlArr{
                    self.url = (dic["_content"] as? String)!
            }
        }
	}
        */
}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if farm != nil{
			dictionary["farm"] = farm
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isfamily != nil{
			dictionary["isfamily"] = isfamily
		}
		if isfriend != nil{
			dictionary["isfriend"] = isfriend
		}
		if ispublic != nil{
			dictionary["ispublic"] = ispublic
		}
		if owner != nil{
			dictionary["owner"] = owner
		}
		if secret != nil{
			dictionary["secret"] = secret
		}
		if server != nil{
			dictionary["server"] = server
		}
		if title != nil{
			dictionary["title"] = title
		}
		if page != nil{
			dictionary["page"] = page
		}
		if pages != nil{
			dictionary["pages"] = pages
		}
		if perpage != nil{
			dictionary["perpage"] = perpage
		}
		if photo != nil{
			var dictionaryElements = [NSDictionary]()
			for photoElement in photo {
				dictionaryElements.append(photoElement.toDictionary())
			}
			dictionary["photo"] = dictionaryElements
		}
		if total != nil{
			dictionary["total"] = total
		}
		return dictionary
	}

}
