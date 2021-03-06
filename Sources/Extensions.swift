//
//  Extensions.swift
//  MacDivvun
//
//  Created by Brendan Molloy on 5/10/16.
//  Copyright © 2016 Divvun. All rights reserved.
//

import Foundation

extension Process {
    convenience init(launchPath: String, arguments: [String]? = nil) {
        self.init()
        
        self.launchPath = launchPath
        self.arguments = arguments
    }
}

fileprivate let pbs = "/System/Library/CoreServices/pbs"

extension NSSpellServer {
    static func flushCache() {
        let proc = Process(launchPath: pbs, arguments: ["-flush"])
        proc.launch()
        proc.waitUntilExit()
    }
    
    static func updateCache() {
        let proc = Process(launchPath: pbs, arguments: ["-update"])
        proc.launch()
        proc.waitUntilExit()
    }
}
