//
//  TestView.swift
//  My Shortcuts
//
//  Created by Henry Wu on 5/5/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct GridData: Identifiable, Equatable {
    let id: Int
}

//MARK: - Model

class Model: ObservableObject {
    @Published var data: [GridData]

    let columns = [
        GridItem(.fixed(160))
    ]

    init() {
        data = Array(repeating: GridData(id: 0), count: 100)
        for i in 0..<data.count {
            data[i] = GridData(id: i)
        }
    }
}

//MARK: - Grid

struct DemoDragRelocateView: View {

    @State private var dragging: GridData?

    @EnvironmentObject var model: Model
    var body: some View {
        ScrollView {
           LazyVGrid(columns: model.columns, spacing: 32) {
                ForEach(model.data) { d in
                    GridItemView(d: d)
                        .overlay(dragging?.id == d.id ? Color.white.opacity(0.8) : Color.clear)
                        .onDrag {
                            self.dragging = d
                            return NSItemProvider(object: String(d.id) as NSString)
                        }
                        .onDrop(of: [UTType.text], delegate: DragRelocateDelegate(item: d, listData: $model.data, current: $dragging))
                }
           }.animation(.default, value: model.data)
        }
        .onDrop(of: [UTType.text], delegate: DropOutsideDelegate(current: $dragging))
    }
}

//struct DeleteButton1: View {
//    let block: GridData
//    @EnvironmentObject var model: Procedure
//    let onDelete: (Block) -> ()
//    
//    var body: some View {
//        VStack {
//            Button(action: {
//                onDelete(block)
//            }) {
//                Image(systemName: "minus.circle")
//            }
//            .offset(x: 10, y: -10)
//        }
//    }
//}

struct DropOutsideDelegate: DropDelegate {
    @Binding var current: GridData?
        
    func performDrop(info: DropInfo) -> Bool {
        current = nil
        return true
    }
}

struct DragRelocateDelegate: DropDelegate {
    let item: GridData
    @Binding var listData: [GridData]
    @Binding var current: GridData?

    func dropEntered(info: DropInfo) {
        if item != current {
            let from = listData.firstIndex(of: current!)!
            let to = listData.firstIndex(of: item)!
            if listData[to].id != current!.id {
                listData.move(fromOffsets: IndexSet(integer: from),
                    toOffset: to > from ? to + 1 : to)
            }
        }
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }

    func performDrop(info: DropInfo) -> Bool {
        self.current = nil
        return true
    }
}

//MARK: - GridItem

struct GridItemView: View {
    var d: GridData

    var body: some View {
        VStack {
            Text(String(d.id))
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 160, height: 240)
        .background(Color.green)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        DemoDragRelocateView().environmentObject(Model())
    }
}
