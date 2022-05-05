import SwiftUI

struct IfBlock: View {
    @State var input: String = "Input"
    let inputOpts = ["Input 1", "Input 2", "Input 3"]
    @State var condition: String = "Condition"
    let conditionOpts = ["Condition 1", "Condition 2", "Condition 3"]
    @State var parameter: String = "Parameter"
    let parameterOpts = ["Parameter 1", "Parameter 2", "Parameter 3"]
    
    func isParam() -> Bool {
        return input != "Input" && condition != "Condition"
    }
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: iconNameMap["If"]!)
                    .padding(5)
                    .background(iconColorMap["If"])
                    .foregroundColor(Color.white)
                    .cornerRadius(5)
                Text("If")
                Menu(input) {
                    ForEach(inputOpts, id: \.self){ opt in
                        Button(opt, action: {input = opt})
                    }
                }
                .padding(3)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.548, saturation: 0.315, brightness: 0.981, opacity: 0.598)/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
                Menu(condition) {
                    ForEach(conditionOpts, id: \.self){ opt in
                        Button(opt, action: {condition = opt})
                    }
                }
                .padding(3)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.548, saturation: 0.315, brightness: 0.981, opacity: 0.598)/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
                Spacer()
            }
            HStack{
                if isParam() {
                    Menu(parameter) {
                        ForEach(parameterOpts, id: \.self){ opt in
                            Button(opt, action: {parameter = opt})
                        }
                    }
                    .padding(3)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.548, saturation: 0.315, brightness: 0.981, opacity: 0.598)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(5)
                }
                Spacer()
            }
            
        }
        .padding(.all, 12.0)
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
            Image(systemName: iconNameMap["If"]!)
                .padding(5)
                .background(iconColorMap["If"])
                .foregroundColor(Color.white)
                .cornerRadius(5)
            Text("End if")
            Spacer()
        }
        .padding(.all, 12.0)
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
