//
//  DeleteButton.swift
//  My Shortcuts
//
//  Created by Henry Wu on 5/6/22.
//

import SwiftUI

struct DeleteButton: View {
    let block: Block
    @EnvironmentObject var procedure: Procedure
    let onDelete: (IndexSet) -> ()
    
    var body: some View {
        VStack {
            
            Button(action: {
                if let index = procedure.blocks.firstIndex(of: block) {
                    self.onDelete(IndexSet(integer: index))
                }
            }) {
                Image(systemName: "xmark.circle")
            }
            .offset(x: -25, y: 30)
            
        }
    }
}
