//
//  FilesGrid.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import Foundation
import SwiftUI
import WaterfallGrid
import Files

struct FilesGrid: View {
    var filter = FilesFilter(types: [ImageFilter()])
    var scrollDirection: Axis.Set
    
    @AppStorage("columnSize") private var columnSize = 250.0
    
    var body: some View {
        do {
//            let content = try Folder(path: "/Users/a/Downloads/Wedding/small/").files.filter({ file in
//                filter.check(path: file.url)
//            }).map({file in
//                file.url
//            })
            let directory = FileManager.default.homeDirectoryForCurrentUser
            let directoryContent = try FileManager.default.contentsOfDirectory(at: directory.appendingPathComponent("Downloads/Wedding/small/"), includingPropertiesForKeys: nil).filter({ path in
                filter.check(path: path)
            })
            
            return AnyView(WaterfallGrid(directoryContent, id: \.self) { url in
                FileView(file: FileModel(path: url), scrollDirection: scrollDirection)
            }.scrollOptions(direction: .vertical).gridStyle(spacing: 0, animation: nil)
            )
        } catch {
            print(error)
            return AnyView(Rectangle())
        }
    }
}
