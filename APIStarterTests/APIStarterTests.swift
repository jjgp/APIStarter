//
//  APIStarterTests.swift
//  APIStarterTests
//
//  Created by Jason Prasad on 7/17/20.
//  Copyright © 2020 Jason Prasad. All rights reserved.
//

import XCTest
@testable import APIStarter

// SwiftyJSON

struct SubredditJSON: Decodable {
    let kind: String
}

class APIStarterTests: XCTestCase {

    func testExample() throws {
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://www.reddit.com/.json")!
        let expect = expectation(description: "dataTask completes")
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            let json = try? JSONDecoder().decode(SubredditJSON.self, from: data!)
            print(json)
            expect.fulfill()
        }
        dataTask.resume()
        print("foo")
        
        wait(for: [expect], timeout: 1.0)
    }

}
