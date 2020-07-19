//
//  ComputeResourceConsumptionTests.swift
//  ResourceConsumptionToolTests
//
//  Created by Suhas Madnanth on 30/05/20.
//  Copyright © 2020 ResourceConsumptionTool. All rights reserved.
//

import XCTest
@testable import ResourceConsumptionTool

class ComputeResourceConsumptionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testComputeResourceComsumption_SingleProcess(){
        let sut = Compute()
        let process = "Finder"
        let cpuUsage = sut.getResourceUtilizationOfEachProcess(processName: process) as NSString
        print("CPU usage in tests is\(cpuUsage)")
        XCTAssert(cpuUsage.floatValue >= 0.00, "CPU computed is not more than 0")
    }
    
    func testComputeResourceConsumption_MultipleProcesses(){
        
    }
}
