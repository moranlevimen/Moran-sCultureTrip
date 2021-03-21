//
//  Article.swift
//  Moran'sCultureTrip
//
//  Created by moran levi on 21/03/2021.
//

import Foundation
struct Article:Decodable {
    let metaData: MetaData?
    let title: String?
    let isSaved:Bool?
    let isLiked:Bool?
    let likesCount: Int?
    let category: String?
    let imageUrl:String?
    let author: AuthorData?
}

struct MetaData:Decodable {
    let creationTime: String?
    let updateTime: String?
}

struct AuthorData:Decodable {
    let authorName: String?
    let authorAvatar:AuthorAvatarData?
    
}
struct AuthorAvatarData:Decodable {
    let imageUrl: String?
}
