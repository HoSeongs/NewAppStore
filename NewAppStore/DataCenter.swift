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
    //let result:
    
    
    
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
    let features:String?
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
    let artistId:String?
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
    let userRatingCount:Float?
}
//{
//    "resultCount":1,
//    "results": [
//    {"isGameCenterEnabled":false,
//    "screenshotUrls":["https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/88/fa/aa/88faaa32-178a-f204-a53b-11957097c2fc/source/392x696bb.jpg",
//    "https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/30/b4/f3/30b4f324-7d6a-e328-35aa-9615344c5ead/source/392x696bb.jpg",
//    "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/29/27/92/2927922b-d19d-71e6-0073-9bd843a3a67e/source/392x696bb.jpg",
//    "https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/1e/7c/3e/1e7c3edf-f3a1-1b0e-ebae-065d1b81a36f/source/392x696bb.jpg",
//    "https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/75/bf/b6/75bfb636-40c4-3df5-2f42-b37f81a471b4/source/392x696bb.jpg"
//    ],
//    "ipadScreenshotUrls":[],
//    "appletvScreenshotUrls":[],
//    "artworkUrl60":"https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/45/ea/37/45ea3716-0b0a-5b01-22e2-cdaf7e8d06da/source/60x60bb.jpg",
//    "artworkUrl512":"https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/45/ea/37/45ea3716-0b0a-5b01-22e2-cdaf7e8d06da/source/512x512bb.jpg",
//    "artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Purple115/v4/45/ea/37/45ea3716-0b0a-5b01-22e2-cdaf7e8d06da/source/100x100bb.jpg",
//    "artistViewUrl":"https://itunes.apple.com/kr/developer/viva-republica/id446370314?uo=4",
//    "kind":"software",
//    "features":[],
//    "supportedDevices":[
//          "iPad2Wifi-iPad2Wifi",
//          "iPad23G-iPad23G",
//          "iPhone4S-iPhone4S",
//          "iPadThirdGen-iPadThirdGen",
//          "iPadThirdGen4G-iPadThirdGen4G",
//          "iPhone5-iPhone5",
//    "iPodTouchFifthGen-iPodTouchFifthGen",
//    "iPadFourthGen-iPadFourthGen",
//    "iPadFourthGen4G-iPadFourthGen4G",
//    "iPadMini-iPadMini",
//    "iPadMini4G-iPadMini4G",
//    "iPhone5c-iPhone5c",
//    "iPhone5s-iPhone5s",
//    "iPadAir-iPadAir",
//    "iPadAirCellular-iPadAirCellular",
//    "iPadMiniRetina-iPadMiniRetina",
//    "iPadMiniRetinaCellular-iPadMiniRetinaCellular",
//    "iPhone6-iPhone6",
//    "iPhone6Plus-iPhone6Plus",
//    "iPadAir2-iPadAir2",
//    "iPadAir2Cellular-iPadAir2Cellular",
//    "iPadMini3-iPadMini3",
//    "iPadMini3Cellular-iPadMini3Cellular",
//    "iPodTouchSixthGen-iPodTouchSixthGen",
//    "iPhone6s-iPhone6s",
//    "iPhone6sPlus-iPhone6sPlus",
//    "iPadMini4-iPadMini4",
//    "iPadMini4Cellular-iPadMini4Cellular",
//    "iPadPro-iPadPro",
//    "iPadProCellular-iPadProCellular",
//    "iPadPro97-iPadPro97",
//    "iPadPro97Cellular-iPadPro97Cellular",
//    "iPhoneSE-iPhoneSE",
//    "iPhone7-iPhone7",
//    "iPhone7Plus-iPhone7Plus",
//    "iPad611-iPad611",
//    "iPad612-iPad612",
//    "iPad71-iPad71",
//    "iPad72-iPad72",
//    "iPad73-iPad73",
//    "iPad74-iPad74",
//    "iPhone8-iPhone8",
//    "iPhone8Plus-iPhone8Plus",
//    "iPhoneX-iPhoneX",
//    "iPad75-iPad75",
//    "iPad76-iPad76"
//    ],
//    "advisories":[],
//    "averageUserRatingForCurrentVersion":4.5,
//    "trackCensoredName":"토스",
//    "languageCodesISO2A":["EN", "KO"],
//    "fileSizeBytes":"155244544",
//    "sellerUrl":"https://toss.im",
//    "contentAdvisoryRating":"4+",
//    "userRatingCountForCurrentVersion":408,
//    "trackViewUrl":"https://itunes.apple.com/kr/app/%ED%86%A0%EC%8A%A4/id839333328?mt=8&uo=4",
//    "trackContentRating":"4+",
//    "releaseDate":"2014-03-27T23:55:28Z",
//    "genreIds":["6015", "6012"],
//    "currentVersionReleaseDate":"2018-06-11T12:46:13Z",
//    "releaseNotes":"1. 돈 걷기를 거절하는 기능이 추가되었습니다.\n2. 그 외 보고되거나 발견된 버그를 수정하였습니다.\n\n토스는 고객님에게 최상의 사용 경험을 제공하기 위해, 매일 앱을 개선해서 2주마다 업데이트를 합니다. 더 쉽고 빨라진 토스를 경험해보세요.",
//    "currency":"USD",
//    "wrapperType":"software",
//    "version":"3.13.1",
//    "description":"한 번도 안 쓴 사람은 있어도 한 번만 쓴 사람은 없다는 토스! \n토스 앱에서 어디까지 할 수 있을까요? \n\n● 토스, 안심하고 쓰세요\n· 누적 송금액 15조, 보안사고 0건 (2018년 3월 기준)\n· 해킹 방어수준 25개 금융 앱 중 종합 1위 기록 (2017년 스틸리언 분석)\n· 카드사 수준 글로벌 데이터 보안 표준 'PCI-DSS' 업계 최초로 획득\n· 24시간 관제 시스템과 이상금융거래탐지시스템으로 각종 위험을 예방\n\n● 내 모든 계좌 한 번에 조회 \n· 흩어져 있는 모든 내 계좌 한눈에 확인 및 관리\n· 휴면계좌 조회하고 숨은 돈 찾기 (국내 26개 은행과 증권사 지원)\n· 휴면계좌 바로 해지 가능\n\n● 내 모든 카드 한 번에 조회 \n· 발급받은 모든 신용/체크카드 한눈에 확인 및 관리\n· 이번 달 카드값과 할부 확인, 연체 방지\n\n● 신용등급 조회 무제한 무료 \n· 신용등급 영향 없이 무제한 무료 조회\n· 카드, 대출, 연체 및 보증 현황까지 한 번에 조회\n. 내 카드값과 대출 잔액을 고신용 그룹과 비교 분석\n\n● 세상에서 가장 간편한 송금\n· 계좌번호를 복사하면 자동으로 입력\n· 공인인증서 없이 간단한 패스워드 / 지문 / 얼굴 인식(Face ID)만으로 바로 송금\n· 더치페이, 금액 자동계산부터 입금 요청까지\n· 토스 계좌에서 송금 시 수수료 무제한 무료\n\n● 간편 송금만큼 간단한 돈 불리기 \n· 부동산 소액투자, 펀드 소액투자, P2P 분산투자, 잔돈벌기까지\n· 적금보다 최대 7배까지 높은 수익률, 최소 천원부터 가볍게 시작\n\n● 내 모든 보험 한 번에 조회\n· 과도한 보험 없는지 진단 가능\n· 나에게 딱 맞는 보험 추천받기\n\n●● 토스는 누가 운영하나요?\n토스를 운영하는 '비바리퍼블리카'는 전자금융거래법 제28조에 따라 보안과 관제 시스템에 대한 금융감독원의 실사 및 금융위원회의 승인을 통해 전자금융업으로 등록된 핀테크 기업입니다. 2017년 KPMG가 선정한 전 세계 100대 핀테크 기업 중 35위에 선정되었으며, 국내 최대 범위의 은행 및 증권사와의 공식 제휴로 쉽고 간편한 금융 서비스를 안전하게 제공하고 있습니다. \n\n●● 토스 앱은 서비스 운영 및 보안 강화에 꼭 필요한 권한만 사용합니다.\n연락처: 연락처 통해 송금 시 필요한 선택적 권한\n카메라:  카드 조회 시 실물카드 인식, QR코드 인식, 송금 및 비대면 계좌 개설을 위해 신분증 촬영 시 필요한 선택적 권한\n사진: QR코드 등 이미지를 저장 시 필요한 선택적 권한\n위치: 부정거래 방지 및 서비스 개선에 필요한 선택적 권한\n\n●● 토스 고객센터는 24시간 열려있습니다. \n전화 1599-4905  \n카카오톡 @toss\n이메일 support@toss.im\n \n-\n(주)비바리퍼블리카\n서울시 강남구 테헤란로 142 아크플레이스(구 캐피탈타워) 12층 (06236)",
//    "artistId":446370314,
//    "artistName":"Viva Republica",
//    "genres":["금융", "라이프 스타일"],
//    "price":0.00,
//    "bundleId":"com.vivarepublica.cash",
//    "trackId":839333328,
//    "trackName":"토스",
//    "formattedPrice":"무료",
//    "primaryGenreName":"Finance",
//    "primaryGenreId":6015,
//    "minimumOsVersion":"9.0",
//    "sellerName":"Viva Republica",
//    "isVppDeviceBasedLicensingEnabled":true,
//    "averageUserRating":4.5,
//    "userRatingCount":29111}]
//}

