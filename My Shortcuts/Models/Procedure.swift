import Foundation
import SwiftUI

// per shortcut info struct (wrapper of [block])
class Procedure: ObservableObject {
    @Published var blocks = [Block]()
    @Published var currentBlock: Block?
    
    // Create new blocks
    func add(type: String){
        blocks.append(Block(type: type, pairedIndex: blocks.count+1))
        if type == "If"{
            blocks.append(Block(type: "End", pairedIndex: blocks.count-1))
        }
    }
}
