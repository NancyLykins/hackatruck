import SwiftUI

struct AppView: View {
    var body: some View {
        ZStack{
            Color(.purple)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack{
                Color(.black)
                    .clipShape(Circle())
                    .frame(width: 350, height: 350)
                Image(systemName: "flag.checkered")
                    .resizable()
                    .foregroundColor(.purple)
                    .frame(width: 250, height: 250)
            }
        }
    }
}

#Preview {
    AppView()
}
