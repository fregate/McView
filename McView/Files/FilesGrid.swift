//
//  FilesGrid.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import Foundation
import SwiftUI
import WaterfallGrid

struct FilesGrid: View {
    var filter = FilesFilter(types: [ImageFilter()])
    var scrollDirection: Axis.Set
    
    var body: some View {
        do {
            let col = [GridItem(.flexible()), GridItem(.flexible())]
            let directory = URL(string: "/Users/a/Downloads/Wedding/small/")!
            let directoryContent = try FileManager.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil).filter({ path in
                filter.check(path: path)
            }).sorted(by: {
                $0.absoluteString < $1.absoluteString
            })

            return AnyView(
                ScrollView {
                    LazyVGrid(columns: col) {
                        ForEach(directoryContent, id: \.self) {
                            FileView(file: FileModel(path: $0), scrollDirection: .vertical)
                        }
                    }
                }
            )
        } catch {
            print(error)
            return AnyView(Rectangle())
        }
    }
}
