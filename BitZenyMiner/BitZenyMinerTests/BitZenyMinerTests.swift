//
//  BitZenyMinerTests.swift
//  BitZenyMinerTests
//
//  Created by ottylab on 2018/03/30.
//  Copyright © 2018 ottylab. All rights reserved.
//

import XCTest
@testable import BitZenyMiner

class BitZenyMinerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLogQueue() {
        let CAPACITY = 10

        var queue: [String] = []
        for i in 0..<CAPACITY * 10 {
            let output = Utils.rotateStringueue(queue: &queue, maxSize: CAPACITY, next: String(i))

            var j = 0
            for element in queue {
                let expected = ((i < CAPACITY) ? 0 : i - CAPACITY + 1) + j
                j += 1
                XCTAssertEqual(String(expected), element)
            }
        }
    }
}
