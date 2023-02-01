//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Pusiewicz, M. (Mateusz) on 01/02/2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void )
}
