//
//  SampleProcessTests.swift
//  ResourceConsumptionToolTests
//
//  Created by Suhas Madnanth on 30/05/20.
//  Copyright © 2020 ResourceConsumptionTool. All rights reserved.
//

import XCTest
@testable import ResourceConsumptionTool

class SampleProcessTests: XCTestCase {
    
    var sut: Sample!

    override func setUp() {
        sut = Sample()
    }

    override func tearDown() {
        sut = nil
    }

    func testSample_SingleProcess(){
        let process = "Google Chrome"
        sut.getSampleOfProcess(processName: process)
        let path = "/Users/Shared/Sample_Google Chrome.txt"
        let fileManager = FileManager.default
        XCTAssert(fileManager.fileExists(atPath: path), "The file doesnt exists at the path specified")
    }
    
    func testSample_MultipleProcesses(){
        let processArray = ["Google Chrome", "Skype"]
        sut.getSampleOfTheProcesses(processArray as NSArray)
        let chromePath = "/Users/Shared/Sample_Google Chrome.txt"
        let skypePath = "/Users/Shared/Sample_Skype.txt"
        let fileManager = FileManager.default
        XCTAssert(fileManager.fileExists(atPath: chromePath), "The file doesnt exists at the path specified")
        XCTAssert(fileManager.fileExists(atPath: skypePath), "The file doesnt exists at the path specified")
    }
}
