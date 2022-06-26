//
//  FileView.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import Foundation
import SwiftUI
import AppKit

struct FileView: View {
    let file: FileModel
    let scrollDirection: Axis.Set

    @AppStorage("columnSize") private var columnSize = 250.0
    @AppStorage("padding") private var padding = 8.0
    @AppStorage("bgColor") private var bgColor = Color.gray

    var body: some View {
        ZStack {
            AsyncImage(
                url: file.path,
                placeholder: { Text("Loading...") },
                image: {
                    Image(nsImage: $0)
                        .resizable()
                        .antialiased(true)
                    }
            )
            .aspectRatio(contentMode: .fit)
//            .frame(width: scrollDirection == .vertical ? columnSize : nil, height: scrollDirection == .horizontal ? 250 : nil)

            Text("\(file.path.lastPathComponent)")
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
        }.padding(EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding))
    }
}
