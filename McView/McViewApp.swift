//
//  McViewApp.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import SwiftUI

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { gp in
                Color.clear.preference(key: SizePreferenceKey.self, value: gp.size)
            }
        ).onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

@main
struct McViewApp: App {
    @AppStorage("windowWidth") private var windowWidth = 300.0
    @AppStorage("windowHeight") private var windowHeight = 300.0
    
    var body: some Scene {
        WindowGroup {
            ContentView().frame(minWidth: 300, minHeight: 300).readSize { size in
                windowWidth = size.width
                windowHeight = size.height
            }
        }
        
        Settings {
            SettingsView()
        }
    }
}
