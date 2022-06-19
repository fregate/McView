//
//  SettingsView.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import SwiftUI

extension Color: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else {
            self = .black
            return
        }
        
        do {
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Color ?? .black
            self = Color(color.rawValue)
        } catch {
            self = .black
        }
        
    }

    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch {
            return ""
        }
    }
}

private struct GeneralSettingsView: View {
    @AppStorage("columnSize") private var columnSize = 250.0
    //@AppStorage("bgColor") private var bgColor = Color.gray
    @AppStorage("padding") private var padding = 8.0

    var body: some View {
        Form {
            Slider(value: $columnSize, in: 150...300) {
                Text("Column Width (\(columnSize, specifier: "%.0f")) px")
            }
            //ColorPicker("Background Color", selection: $bgColor, supportsOpacity: false)
            Slider(value: $padding, in: 0...16) {
                Text("Padding (\(padding, specifier: "%.0f")) px")
            }
        }
        .padding(20)
        .frame(width: 350, height: 300)
    }
}

struct SettingsView: View {
    var body: some View {
        GeneralSettingsView()
    }
}
