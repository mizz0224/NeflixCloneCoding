//
//  YoutubeSearchResponse.swift
//  Netflix CloneCoding
//
//  Created by heojaenyeong on 2022/07/18.
//

import Foundation
struct YoutubeSearchResponse: Codable{
    let items: [VideoElement]
}

struct VideoElement: Codable{
    let id: IdVideoElement
}

struct IdVideoElement:Codable{
    let kind: String
    let videoId: String
}
