//
//  DataCenter.swift
//  NewAppStore
//
//  Created by 최호성 on 2018. 5. 28..
//  Copyright © 2018년 최호성. All rights reserved.
//

import Foundation

struct AppRanking:Decodable{
    let feed:Feed?
}

struct Feed:Decodable {
    let author:Author?
    let entry:[Entry]?
    let updated:Updated?
    let rights:Right?
    let title:Title?
    let icon:Icon?
    let link:[Link]?
    let id:Id?
}

//Author================
struct Author:Decodable{
    let name:Name?
    let uri:Uri?
}

struct Name:Decodable{
    let label:String
}

struct Uri:Decodable{
    let label:String
}
//Author================


//Entry=================
struct Entry:Decodable{
    let imName:ImName?
    let imImage:[ImImage]?
    let summary:Summary?
    let imPrice:ImPrice?
    let imContentType:ImContentType?
    let rights:Right?
    let title:Title?
    let link:Link?
    let id:Id?
    let imArtist:ImArtist?
    let category:Category?
    let imReleaseDate:ImReleaseDate?
    
    enum CodingKeys:String, CodingKey{
        case imName = "im:name"
        case imImage = "im:image"
        case summary = "summary"
        case imPrice = "im:price"
        case imContentType = "im:contentType"
        case rights = "rights"
        case title = "title"
        case link = "link"
        case id = "id"
        case imArtist = "im:artist"
        case category = "category"
        case imReleaseDate = "im:releaseDate"
    }
}

struct ImName:Decodable{
    let label:String?
}

struct ImImage:Decodable{
    let label:String?
    let attributes:attributesForImImage?
}

struct attributesForImImage:Decodable {
    let height:String?
}

struct Summary:Decodable{
    let label:String?
}

struct ImPrice:Decodable{
    let label:String?
    let attributes:attributesForImPrice?
}

struct attributesForImPrice:Decodable{
    let amount:String?
    let currency:String?
}

struct ImContentType:Decodable{
    let attributes:attributesForImContentType?
}

struct attributesForImContentType:Decodable{
    let term:String?
    let label:String?
}

struct Right:Decodable{
    let label:String?
}

struct Title:Decodable{
    let label:String?
}

struct Link:Decodable{
    let attributes:attributesForLink?
}

struct attributesForLink:Decodable{
    let rel:String?
    let type:String?
    let href:String?
}

struct Id:Decodable{
    let label:String?
    let attributes:attributesForId?
}

struct attributesForId:Decodable{
    let imId:String?
    let imBundleId:String?
    
    enum CodingKeys:String, CodingKey{
        case imId = "im:id"
        case imBundleId = "im:bundleId"
    }
}


struct ImArtist:Decodable{
    let label:String
    let attributes:attributesForImArtist?
}

struct attributesForImArtist:Decodable{
    let href:String?
}

struct Category:Decodable{
    let attributes:attributesForCategory?
}

struct attributesForCategory:Decodable{
    let imId:String?
    let term:String?
    let scheme:String?
    let label:String?
    
    enum CodingKeys:String, CodingKey{
        case imId = "im:id"
        case term = "term"
        case scheme = "scheme"
        case label = "label"
    }
}

struct ImReleaseDate:Decodable{
    let label:String?
    let attributes:attributesForImReleaseDate?
}

struct attributesForImReleaseDate:Decodable{
    let label:String?
}
//Entry=================

//Updated=================
struct Updated:Decodable{
    let label:String?
}

struct Rights:Decodable{
    let label:String?
}

struct Icon:Decodable{
    let label:String?
}

//ImageData===========
struct ImageDictionary{
    let imageData:[String:Any]?
}



