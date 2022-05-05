import SwiftUI

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
        _ = procedure.updateIndent()
    }
    
    // Reorder Block(s)
    // Revert if necessary
    func moveBlock(from source: IndexSet, to destination: Int) {
        let blocksCp = procedure.blocks
        procedure.blocks.move(fromOffsets: source, toOffset: destination)
        if (procedure.updateIndent() == false) {
            procedure.blocks = blocksCp
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(procedure.blocks){ block in
                        if block.type == "Text"{
                            TextBlock()
                                .padding(.leading, block.indent)
                        }
                        else if block.type == "If"{
                            IfBlock()
                                .padding(.leading, block.indent)
                        }
                        else if block.type == "End"{
                            EndifBlock()
                                .padding(.leading, block.indent)
                        }
                    }
                    .onMove(perform: moveBlock)
                    .onDelete(perform: deleteBlock)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .environment(\.editMode, $editMode)
                
                Section(header: Text("Next Action Suggestions")
                            .foregroundColor(Color.gray)
                ){
                    VStack{
                        CreateRow(type: "If")
                        CreateRow(type: "Text")
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
