import Foundation
import SwiftUI

// block info struct
struct Block: Codable, Equatable, Identifiable {
    var id: UUID
    var type: String
    var indent: CGFloat = indentStart
    var pairedIndex: Int = -1
    
    #if DEBUG
    static let example1 = Block(id: UUID(), type: "Text")
    static let example2 = Block(id: UUID(), type: "If")
    static let example3 = Block(id: UUID(), type: "End")
    #endif
}
