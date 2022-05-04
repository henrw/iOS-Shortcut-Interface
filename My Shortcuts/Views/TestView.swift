//
//  TestView.swift
//  My Shortcuts
//
//  Created by Henry Wu on 4/26/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct Sample: View {
    @State private var items: [Item] = [
        Item(title: "Apple"),
        Item(title: "Banana"),
        Item(title: "Papaya"),
        Item(title: "Mango")
    ]
    
    var body: some View {
        List {
            ScrollView {
                ForEach(items) { item in
                    SampleCell(item: item)
                        .onDrop(of: [UTType.text], delegate:dropDelegate() )
                        .onDrag{
                            NSItemProvider(item: .some(URL(string: "item")! as NSSecureCoding), typeIdentifier: String() )
                        }
                }
            }
            Text("Drop Item Here..")
                .fontWeight(.heavy)
                .onDrop(of: [UTType.text], delegate:dropDelegate() )//works
            
        }
    }
}

class dropDelegate: DropDelegate {

    func performDrop(info: DropInfo) -> Bool {
        print("drop success")
        return true
    }
}

struct SampleCell: View {
    var item : Item
    var body: some View {
        HStack {
            Text(item.title).padding()
            Spacer()
        }.frame(maxWidth:.infinity, minHeight: 60)
            .background(Color.gray)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        Sample()
    }
}
