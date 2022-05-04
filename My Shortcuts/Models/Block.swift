//
//  BlockType.swift
//  My Shortcuts
//
//  Created by Henry Wu on 4/26/22.
//

import Foundation
import SwiftUI

struct Block: Codable, Equatable, Identifiable{
    var id: UUID
    var type: String
    var text: [String]
    var indent: CGFloat = 0
    var pairedIndex: Int = -1
//    var iconName: String
    
    #if DEBUG
    static let example1 = Block(id: UUID(), type: "Text", text: [String]())
    static let example2 = Block(id: UUID(), type: "If", text: [String]())
    static let example3 = Block(id: UUID(), type: "End", text: [String]())
    #endif
}
