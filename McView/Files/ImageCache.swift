//
//  ImageCache.swift
//  McView
//
//  Created by Anton Filippov on 26.06.2022.
//

import Foundation
import AppKit

protocol ImageCache {
    subscript(_ url: URL) -> NSImage? { get set }
}

struct TemporaryImageCache: ImageCache {
    private let cache: NSCache<NSURL, NSImage> = {
        let cache = NSCache<NSURL, NSImage>()
        cache.countLimit = 100 // 100 items
        cache.totalCostLimit = 1024 * 1024 * 100 // 100 MB
        return cache
    }()

    subscript(_ key: URL) -> NSImage? {
        get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    }
}
