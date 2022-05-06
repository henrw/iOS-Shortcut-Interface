import SwiftUI

struct DropViewDelegate: DropDelegate {
    
    var block: Block
    @Binding var blocks: [Block]
    @Binding var current: Block?
    
    func performDrop(info: DropInfo) -> Bool {
        current = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        if block != current {
            let from = blocks.firstIndex(of: current!)
            let to = blocks.firstIndex(of: block)
            if from != nil && to != nil {
                if blocks[to!].id != current!.id {
                    let blocksCp = blocks
                    blocks.move(fromOffsets: IndexSet(integer: from!),
                        toOffset: to! > from! ? to! + 1 : to!)
                    if updateIndent(blocks: &blocks) == false {
                        blocks = blocksCp
                    }
                }
            }
            
        }
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}

