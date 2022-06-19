//
//  FileView.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import Foundation
import SwiftUI
import Files
import AppKit


extension Image {
    /// Initializes a SwiftUI `Image` from data.
    init?(data: Data?) {
        if data == nil {
            return nil
        }
        
        if let nsImage = NSImage(data: data!) {
            self.init(nsImage: nsImage)
        } else {
            return nil
        }
    }
}

struct FileView: View {
    let file: FileModel
    let scrollDirection: Axis.Set

    @AppStorage("columnSize") private var columnSize = 250.0
    @AppStorage("padding") private var padding = 8.0
    @AppStorage("bgColor") private var bgColor = Color.gray
    
    var body: some View {
        ZStack {
            if let imageFile = try? File(path: file.path.absoluteString) {
                Image(data: try? imageFile.read())
                    .frame(width: scrollDirection == .horizontal ? columnSize : nil, height: scrollDirection == .vertical ? columnSize : nil)
            } else {
                Rectangle().frame(width: scrollDirection == .horizontal ? columnSize : nil, height: scrollDirection == .vertical ? columnSize : nil)
            }
            Text("\(file.path.lastPathComponent)")
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
        }.padding(EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding))
    }
}
