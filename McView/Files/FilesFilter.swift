//
//  FilesFilter.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import Foundation
import SwiftUI

class Filter {
    public func check(uri: URL) -> Bool {
        return false
    }
}

class ImageFilter: Filter {
    public override func check(uri: URL) -> Bool {
        return uri.containsImage
    }
}

class VideoFilter: Filter {
    public override func check(uri: URL) -> Bool {
        return uri.containsVideo
    }
}

struct FilesFilter {
    var types: [Filter]
    
    public func check(path: URL) -> Bool {
        return types.contains(where: { it in
            return it.check(uri: path)
        })
    }
}
