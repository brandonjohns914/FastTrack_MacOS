//
//  Track.swift
//  FastTrack
//
//  Created by Brandon Johns on 1/7/24.
//

import Foundation

struct Track: Identifiable, Decodable {
    
    let trackId: Int
    var id : Int { trackId }
    let artistName: String
    let trackName: String
    let previewUrl: URL
    let artworkUrl100: String
    
    var artworkURL: URL? {
        let replacedString = artworkUrl100.replacingOccurrences(of: "100x100", with: "300x300")
        return URL(string: replacedString)
    }
}

struct SearchResult: Decodable {
    let results: [Track]
}
