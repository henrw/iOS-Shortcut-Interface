import SwiftUI

struct BlockView: View {
    var type: String
    var body: some View {
        if type == "Text"{
            TextBlock()
        }
        else if type == "If"{
            IfBlock()
        }
        else if type == "End"{
            EndifBlock()
        }
    }
}

struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView(type: "If")
    }
}
