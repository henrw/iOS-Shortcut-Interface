//
//  BlockView.swift
//  My Shortcuts
//
//  Created by Henry Wu on 4/26/22.
//

import SwiftUI


struct TextBlock: View {
    //    @EnvironmentObject var procedure: Procedure
    //    var index: Int
    @State var text : String = ""
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "text.alignleft")
                    .padding(5)
                    .foregroundColor(Color.white)
                    .background(Color.yellow)
                    .cornerRadius(5)
                Text("Text")
                Spacer()
            }
            
            Divider()
            
            TextField("Text",text: $text)
                .frame(height: 100, alignment: .top)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct TextBlock_Previews: PreviewProvider {
    static var previews: some View {
        TextBlock()
    }
}
