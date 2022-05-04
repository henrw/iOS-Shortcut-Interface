//
//  IfBlockView.swift
//  My Shortcuts
//
//  Created by Henry Wu on 4/27/22.
//

import SwiftUI

struct IfBlock: View {
    //    @EnvironmentObject var procedure: Procedure
    //    var index: Int
    @State var input: String = "Input"
    let inputOpts = ["Input 1", "Input 2", "Input 3"]
    @State var condition: String = "Condition"
    let conditionOpts = ["Condition 1", "Condition 2", "Condition 3"]
    
    
    var body: some View {
        HStack{
            Image(systemName: "arrow.triangle.branch")
                .padding(5)
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(5)
            Text("If")
            TextField("Input",text : $input)
                .foregroundColor(Color.blue)
                .padding(3)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.548, saturation: 0.315, brightness: 0.981, opacity: 0.598)/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
//            Picker(selection: $input, label: EmptyView()) {
//                ForEach(inputOpts, id: \.self) {
//                    Text($0)
//                }
//            }
//            .foregroundColor(Color.blue)
//            .padding(3)
//            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.548, saturation: 0.315, brightness: 0.981, opacity: 0.598)/*@END_MENU_TOKEN@*/)
//            .cornerRadius(5)
            
//            Picker(selection: $condition, label: EmptyView()) {
//                ForEach(conditionOpts, id: \.self) {
//                    Text($0)
//                }
//            }
//            .foregroundColor(Color.blue)
//            .padding(3)
//            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.548, saturation: 0.315, brightness: 0.981, opacity: 0.598)/*@END_MENU_TOKEN@*/)
//            .cornerRadius(5)
            TextField("Condition",text : $condition)
                .foregroundColor(Color.blue)
                .padding(3)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.548, saturation: 0.315, brightness: 0.981, opacity: 0.598)/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

//struct OtherwiseBlock: View {
//    var body: some View {
//        HStack{
//            Image(systemName: "arrow.triangle.branch")
//                .padding(5)
//                .background(Color.gray)
//                .foregroundColor(Color.white)
//                .cornerRadius(5)
//            Text("Otherwise")
//        }
//        .padding()
//        .frame(width: blockWidth[0], alignment: .leading)
//        .background(Color.white)
//        .cornerRadius(10)
//    }
//}

struct EndifBlock: View {
    
    var body: some View {
        HStack{
            Image(systemName: "arrow.triangle.branch")
                .padding(5)
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(5)
            Text("End if")
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct IfBlock_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            IfBlock()
            EndifBlock()
        }
        
    }
}
