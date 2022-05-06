import SwiftUI

struct TextBlock: View {
    @State var text : String = ""
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: iconNameMap["Text"]!)
                    .padding(5)
                    .foregroundColor(Color.white)
                    .background(iconColorMap["Text"])
                    .cornerRadius(5)
                Text("Text")
                Spacer()
            }
            
            Divider()
            
            ZStack {
                if self.text.isEmpty {
                    TextEditor(text: .constant("Text"))
                        .font(.body)
                        .foregroundColor(.gray)
                        .disabled(true)
                }
                TextEditor(text: $text)
                    .font(.body)
                    .opacity(self.text.isEmpty ? 0.25 : 1)
            }
            .frame(height: 60)
        }
        .padding()
        .background(Color.white)
    }
}

struct TextBlock_Previews: PreviewProvider {
    static var previews: some View {
        TextBlock()
    }
}
