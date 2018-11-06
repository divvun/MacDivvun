//
//  Extensions.swift
//  MacDivvun
//
//  Created by Brendan Molloy on 5/10/16.
//  Copyright © 2016 Divvun. All rights reserved.
//

import Foundation
import XCGLogger

let log = XCGLogger.default

extension Process {
    convenience init(launchPath: String, arguments: [String]?=nil) {
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

//func log.debug(_ value: String) {
////    #if DEBUG
//    print(value)
//    if #available(OSX 10.12, *) {
//        os_log.debug("%@", value)
//    } else {
//        NSLog(value)
//    }
////    #endif
//}

func doublePointerToArray<A>(pointer: UnsafeMutablePointer<A?>) -> [A] {
    var iterator = pointer
    var values: [A] = []
    
    while iterator.pointee != nil {
        if let pointee = iterator.pointee {
            values.append(pointee)
        }
        iterator = iterator.successor()
    }
    return values
}
