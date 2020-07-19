//
//  Sample.swift
//  ResourceConsumptionTool
//
//  Created by Suhas Madnanth on 29/03/20.
//  Copyright © 2020 ResourceConsumptionTool. All rights reserved.
//

import Foundation

struct Sample {

    func getSampleOfTheProcesses(_ arrayContainingNamesToTakeSample:NSArray)  {
        for processNameInArray in arrayContainingNamesToTakeSample{
            getSampleOfProcess(processName: processNameInArray as! String)
        }
    }
    
    func getSampleOfProcess(processName: String) {
        let task1 = Process()
        let pipe1 = Pipe()
        task1.launchPath = "/usr/bin/pgrep"
        task1.arguments = ["-x",processName]
        task1.standardOutput = pipe1
        task1.standardError = pipe1
        do {
            try task1.run()
        }catch {
            print("Error: \(error)")
        }
        let handle1 = pipe1.fileHandleForReading
        let data1 = handle1.readDataToEndOfFile()
        let processIDObtainedFromCode = String (data: data1, encoding: String.Encoding.utf8)
        
        // Task 2 to get the sample of the processes
        let sampleProcessTask = Process()
        let sampleProcessPipe = Pipe()
        sampleProcessTask.launchPath = "/usr/bin/sample"
        sampleProcessTask.arguments = [processIDObtainedFromCode!.replacingOccurrences(of: "\n", with: ""), "4" ,"-file", "/Users/Shared/Sample_\(processName).txt"]
        sampleProcessTask.standardInput = task1.standardOutput
        sampleProcessTask.standardOutput = sampleProcessPipe
        do {
            try sampleProcessTask.run()
        }catch {
            print("Error: \(error)")
        }
        let sampleProcessData = sampleProcessPipe.fileHandleForReading.readDataToEndOfFile()
        let _ = String (data: sampleProcessData, encoding: String.Encoding.utf8)
        
    }
    
    func openSharedFolder() {
        let openFolderTask = Process()
        let openFolderPipe = Pipe()
        openFolderTask.launchPath = "/usr/bin/open"
        openFolderTask.arguments = ["/Users/Shared"]
        openFolderTask.standardOutput = openFolderPipe
        openFolderTask.standardError = openFolderPipe
        do {
            try openFolderTask.run()
        }catch {
            print("Error: \(error)")
        }
        DispatchQueue.global(qos: .background).async {
            let openFolderData = openFolderPipe.fileHandleForReading.readDataToEndOfFile()
            let _ = String (data: openFolderData, encoding: String.Encoding.utf8)
        }
        
    }
}
