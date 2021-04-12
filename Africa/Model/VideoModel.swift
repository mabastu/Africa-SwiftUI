//
//  VideoModel.swift
//  Africa
//
//  Created by Mabast on 3/31/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
