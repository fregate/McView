//
//  ContentView.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import SwiftUI
import WaterfallGrid

struct ContentView: View {
    var body: some View {
        FilesGrid(scrollDirection: .vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
