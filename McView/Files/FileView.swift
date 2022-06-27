//
//  FileView.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import Foundation
import SwiftUI
import AppKit

extension NSImage{
    var pixelSize: NSSize?{
        if let rep = self.representations.first{
            let size = NSSize(width: rep.pixelsWide, height: rep.pixelsHigh)
            return size
        }
        return nil
    }
}

struct FileView: View {
    let file: FileModel
    let scrollDirection: Axis.Set

    @AppStorage("padding") private var padding = 8.0

    @State private var isHover = false

    var body: some View {
        AsyncImage(
            url: file.path,
            placeholder: { Text("Loading...") },
            view: {
                let img = $0
                return AnyView(ZStack {
                    let imageSize = img.pixelSize!
                    Image(nsImage: img)
                        .resizable()
                        .interpolation(.high)

                    if (isHover) {
                        Text("\(file.path.lastPathComponent), \(String(format: "%0.f", imageSize.width))x\(String(format: "%0.f", imageSize.height)) px")
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                    }
                }.padding(.all, padding))
            }
        )
        .aspectRatio(contentMode: .fit)
        .onHover(perform: { isHover = $0 })
    }
}
