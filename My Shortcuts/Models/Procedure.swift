//
//  Procedure.swift
//  My Shortcuts
//
//  Created by Henry Wu on 5/2/22.
//

import Foundation
import SwiftUI

class Procedure: ObservableObject {
    @Published var blocks = [Block]()
    
    func add(type: String){
        blocks.append(Block(id: UUID(), type: type, text: [String](["", "", ""]), pairedIndex: blocks.count+1))
        if type == "If"{
            blocks.append(Block(id: UUID(), type: "End", text: [String](["", "", ""]), pairedIndex: blocks.count-1))
        }
    }
    
    func updateIndent() -> Bool {
        var indent: CGFloat = 0
        var ifCount: Int = 0
        for i in 0..<blocks.count{
            if blocks[i].type == "End" {
                if ifCount == 0{
                    return false
                }
                indent -= indentUnit
                ifCount -= 1
            }
            blocks[i].indent = indent
            if blocks[i].type == "If"{
                indent += indentUnit
                ifCount += 1
            }
        }
        return true
    }
}
