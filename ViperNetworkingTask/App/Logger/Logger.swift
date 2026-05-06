//
//  Logger.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 24/04/26.
//

import Foundation

enum LogLevel {
    case INFO
    case DEBUG
    case ERROR
}

enum Logger {
    static func log(_ message: String? = nil,
                    level: LogLevel,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line) {
#if DEBUG
        let filename = URL(string: file)?.lastPathComponent ?? file
        print("[\(level)] [\(filename):\(function):\(line)] \(message ?? "")")
#endif
    }
}
