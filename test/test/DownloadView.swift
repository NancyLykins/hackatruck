import SwiftUI

struct DownloadView: View {
    var body: some View {
        ZStack{
            Color(.yellow)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack{
                Color(.black)
                    .clipShape(Circle())
                    .frame(width: 350, height: 350)
                Image(systemName: "paintbrush")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 250, height: 250)
            }
        }
    }
}

#Preview {
    DownloadView()
}
