import SwiftUI

struct ContentView: View {
    @State var name: String = "um nomee"
    var body: some View {
        TabView{
            RecivedView()
                .badge(2)
                .tabItem {
                    Label("green", systemImage: "internaldrive")
                }
            AppView()
                .tabItem{
                    Label("yellow", systemImage: "flag.checkered")
                }
            DownloadView()
                .tabItem {
                    Label("yellow", systemImage: "paintbrush")
                }
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
        }.onAppear(){
            UITabBar.appearance().backgroundColor = .lightGray
        }
    }
}

#Preview {
    ContentView()
}
