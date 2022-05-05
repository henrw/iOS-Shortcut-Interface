import SwiftUI

struct CreateRow: View {    
    @EnvironmentObject var procedure: Procedure
    var type: String
    
    var body: some View {
        Button(action: {procedure.add(type: type)}) {
            Label{
                Text(type)
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "plus")
            }icon: {
                Image(systemName: iconNameMap[type]!)
                    .frame(width: 10, height: 10)
                    .padding(6)
                    .foregroundColor(Color.white)
                    .background(iconColorMap[type])
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

struct CreateRow_Previews: PreviewProvider {
    static var previews: some View {
        CreateRow(type: "Text").environmentObject(Procedure())
    }
}
