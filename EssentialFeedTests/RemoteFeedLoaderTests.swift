//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Pusiewicz, M. (Mateusz) on 01/02/2023.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    func load() {
        client.get(from: URL(string: "https://google.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
    
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init() {
        let client = HTTPClientSpy()
        let _ = RemoteFeedLoader(client: client)
        
        
        XCTAssertNil(client.requestedURL)
    }
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
