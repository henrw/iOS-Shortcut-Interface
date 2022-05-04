import SwiftUI

struct TestEditModeCustomRelocate: View {
    @State private var objects = ["1", "2", "3"]
    @State var editMode: EditMode = .active
    func add(){
        objects.append("4")
    }
    var body: some View {
        VStack{
            List {
                ForEach(objects, id: \.self) { object in
                    Text("Row \(object)")
                }
                .onMove(perform: relocate)
                .onDelete(perform: delete)
            }
            .environment(\.editMode, $editMode)
            Button(action: add){
                Text("Test")
            }
        }
        
        
        
    }

    func relocate(from source: IndexSet, to destination: Int) {
        objects.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(from source: IndexSet) {
        objects.remove(atOffsets: source)
    }
}

struct TestEditModeCustomRelocate_Previews: PreviewProvider {
    static var previews: some View {
        TestEditModeCustomRelocate()
    }
}
