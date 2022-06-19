//
//  FileModel.swift
//  McView
//
//  Created by Anton Filippov on 18.06.2022.
//

import Foundation
import SwiftUI

struct FileModel: Identifiable, Equatable {
    var id = UUID()
    var path: URL
}
