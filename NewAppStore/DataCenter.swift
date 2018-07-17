//
//  DataCenter.swift
//  NewAppStore
//
//  Created by 최호성 on 2018. 5. 28..
//  Copyright © 2018년 최호성. All rights reserved.
//

import Foundation

//앱 리스트 설정 ============================================================
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
//앱 리스트 설정 ============================================================



//앱 상세정보 설정 ============================================================
struct AppInfo:Decodable{
    let resultCount:Int?
    let results:[Result]?
}

struct Result:Decodable{
    let isGameCenterEnabled:Bool?
    let screenshotUrls:[String]?
    let ipadScreenshotUrls:[String]?
    let appletvScreenshotUrls:[String]?
    let artworkUrl60:String?
    let artworkUrl512:String?
    let artworkUrl100:String?
    let artistViewUrl:String?
    let kind:String?
    let features:[String]?
    let supportedDevices:[String]?
    let advisories:[String]?
    let averageUserRatingForCurrentVersion:Float?
    let trackCensoredName:String?
    let languageCodesISO2A:[String]?
    let fileSizeBytes:String?
    let sellerUrl:String?
    let contentAdvisoryRating:String?
    let userRatingCountForCurrentVersion:Int?
    let trackViewUrl:String?
    let trackContentRating:String?
    let releaseDate:String?
    let genreIds:[String]?
    let currentVersionReleaseDate:String?
    let releaseNotes:String?
    let currency:String?
    let wrapperType:String?
    let version:String?
    let description:String?
    let artistId:Int?
    let artistName:String?
    let genres:[String]?
    let price:Float?
    let bundleId:String?
    let trackId:Int?
    let trackName:String?
    let formattedPrice:String?
    let primaryGenreName:String?
    let primaryGenreId:Int?
    let minimumOsVersion:String?
    let sellerName:String?
    let isVppDeviceBasedLicensingEnabled:Bool?
    let averageUserRating:Float?
    let userRatingCount:Int?
}
