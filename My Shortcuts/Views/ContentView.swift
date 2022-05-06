import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    
    @EnvironmentObject var procedure: Procedure
    @State var name: String = "Shortcut Name"
    @State var editMode: EditMode = .active
    
    // Delete one block or (paired) blocks
    // Revert if necessary
    func deleteBlock(at offsets: IndexSet) {
        var offsetsCp: IndexSet = offsets
        offsets.forEach { (i) in
            if procedure.blocks[i].type == "If" {
                offsetsCp.insert(procedure.blocks[i].pairedIndex)
            }
        }
        procedure.blocks.remove(atOffsets: offsetsCp)
        _ = updateIndent(blocks: &procedure.blocks)
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                backgroundColor.ignoresSafeArea()
                ScrollView{
                    LazyVStack(spacing: -20){
                        ForEach(procedure.blocks){ block in
                            // Better approach required
                            if block.type == "End"{
                                BlockView(type: block.type)
                                    .cornerRadius(10)
                                    .padding()
                                    .padding(.leading, block.indent)
                                    .onDrag({
                                        procedure.currentBlock = block
                                        return NSItemProvider(contentsOf: URL(string: "\(block.id)")!)!
                                    })
                                    .onDrop(of: [.url], delegate: DropViewDelegate(block: block, blocks: $procedure.blocks, current: $procedure.currentBlock))
                            }
                            else{
                                BlockView(type: block.type)
                                    .cornerRadius(10)
                                    .padding()
                                    .padding(.leading, block.indent)
                                    .onDrag({
                                        procedure.currentBlock = block
                                        return NSItemProvider(contentsOf: URL(string: "\(block.id)")!)!
                                    })
                                    .onDrop(of: [.url], delegate: DropViewDelegate(block: block, blocks: $procedure.blocks, current: $procedure.currentBlock))
                                    .overlay(
                                        DeleteButton(block: block, onDelete: deleteBlock)
                                        , alignment: .topTrailing)
                            }
                        }
                    }
                    
                    Section(header: Text("Next Action Suggestions")
                                .foregroundColor(Color.gray)
                    ){
                        VStack{
                            CreateRow(type: "If")
                            CreateRow(type: "Text")
                        }
                    }
                }
            }
            .navigationBarTitle("New Shortcut", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                    }label: {
                        Image(systemName: "slider.horizontal.3").clipShape(Circle())
                    }
                    .padding(.trailing, -10.0)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        procedure.blocks.removeAll()
                    }label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Procedure())
    }
}
