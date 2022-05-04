//
//  ContentView.swift
//  My Shortcuts
//
//  Created by Henry Wu on 4/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var procedure: Procedure
    @State var name: String = "Shortcut Name"
    @State var editMode: EditMode = .active
    
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
    
    func moveBlock(from source: IndexSet, to destination: Int) {
        let blocksCp = procedure.blocks
        procedure.blocks.move(fromOffsets: source, toOffset: destination)
        if (procedure.blocks[destination].type == "If" ||
            procedure.blocks[destination].type == "End" ){
            procedure.blocks[procedure.blocks[destination].pairedIndex].pairedIndex = destination
        }
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
                    .listRowBackground(backgroundColor)
                    .listRowSeparator(.hidden)
                }
                .environment(\.editMode, $editMode)
                
                Section(header: Text("Next Action Suggestions")
                            .foregroundColor(Color.gray)
                ){
                    Button(action: {procedure.add(type: "If")}) {
                        Label{
                            Text("If")
                                .foregroundColor(Color.black)
                            Spacer()
                            Image(systemName: "plus")
                        }icon: {
                            Image(systemName: "arrow.triangle.branch")
                                .frame(width: 10, height: 10)
                                .padding(6)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(3)
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.horizontal)
                    }
                    Button(action: {procedure.add(type: "Text")}) {
                        Label{
                            Text("Text")
                                .foregroundColor(Color.black)
                            Spacer()
                            Image(systemName: "plus")
                        }icon: {
                            Image(systemName: "text.alignleft")
                                .frame(width: 10, height: 10)
                                .padding(6)
                                .foregroundColor(Color.white)
                                .background(Color.yellow)
                                .cornerRadius(3)
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("New Shortcut")
            //            .toolbar {
            //                EditButton()
            //            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Procedure())
    }
}
