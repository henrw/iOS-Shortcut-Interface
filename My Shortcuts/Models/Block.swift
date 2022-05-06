import Foundation
import SwiftUI

// block info struct
struct Block: Codable, Equatable, Identifiable {
    var id = UUID().uuidString
    var type: String
    var indent: CGFloat = indentStart
    var pairedIndex: Int = -1
    
    #if DEBUG
    static let example1 = Block(type: "Text")
    static let example2 = Block(type: "If")
    static let example3 = Block(type: "End")
    #endif
}
