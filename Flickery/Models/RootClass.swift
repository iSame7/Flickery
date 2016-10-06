//
//	RootClass.swift
//
//	Create by Sameh Mabrouk on 5/10/2016
//	Copyright © 2016. All rights reserved.

import Foundation

struct RootClass{

	var photos : Photo!
	var stat : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let photosData = dictionary["photos"] as? NSDictionary{
				photos = Photo(fromDictionary: photosData)
			}
		stat = dictionary["stat"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if photos != nil{
			dictionary["photos"] = photos.toDictionary()
		}
		if stat != nil{
			dictionary["stat"] = stat
		}
		return dictionary
	}

}
