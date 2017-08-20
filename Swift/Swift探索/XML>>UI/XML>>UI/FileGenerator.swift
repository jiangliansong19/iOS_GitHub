//
//  FileGenerator.swift
//  XML>>UI
//
//  Created by 江连松 on 2017/6/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class FileGenerator {
    
}


extension FileGenerator {
    
    static internal func writeToFileWith(_ name: String, content: String, path: String) throws {
        let filename = path.appendingFormat("%@", (name + ".swift"))
        try FileManager.default.createDirectory(at: URL.init(fileURLWithPath: path),
                                                withIntermediateDirectories: true,
                                                attributes: nil)
        try content.write(toFile: filename, atomically: true, encoding: String.Encoding.utf8)
    }
}
