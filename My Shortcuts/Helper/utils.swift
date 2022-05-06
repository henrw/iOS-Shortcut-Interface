import Foundation
import SwiftUI

// Update indent param && Check Validity with "if-Stack"
func updateIndent(blocks: inout [Block]) -> Bool {
    var indent: CGFloat = indentStart
    var ifIndices: [Int] = [Int]()
    for i in 0..<blocks.count{
        if blocks[i].type == "End" {
            if ifIndices.count == 0{
                return false
            }
            indent -= indentUnit
            let j: Int = ifIndices.popLast()!
            blocks[j].pairedIndex = i
            blocks[i].pairedIndex = j
        }
        blocks[i].indent = indent
        if blocks[i].type == "If"{
            indent += indentUnit
            ifIndices.append(i)
        }
    }
    return true
}
