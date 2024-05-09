//
//  ListView.swift
//  test
//
//  Created by Turma01-10 on 06/05/24.
//

import SwiftUI

struct listElement: Identifiable {
    var id = UUID();
    var name: String;
    var icon: String;
    var bg_color: Color;
    var fnt_color: Color
    var page: AnyView;
}

struct ListView: View {
    @State private var isShowingSheet = false
    var elements =
    [listElement(name: "Menu 1", icon: "cursorarrow.click.2", bg_color: .yellow, fnt_color: .black, page: AnyView(DownloadView())),
    listElement(name: "Menu 2", icon: "arrow.left.to.line", bg_color: .green, fnt_color: .black, page: AnyView(RecivedView())),
    listElement(name: "Menu 3", icon: "figure.run", bg_color: .purple, fnt_color: .black, page: AnyView(AppView()))]
    
    var body: some View {
        
        VStack{
            NavigationStack{
                ForEach(elements){ e in
                    NavigationLink(destination: e.page){
                        ZStack{
                            Text("\(e.name)")
                            Image(systemName: e.icon)
                                .position(x:200, y: 25)
                        }
                    }
                    .frame(width:250, height: 50)
                    .background(e.bg_color)
                    .foregroundColor(e.fnt_color)
                    .cornerRadius(15)
                }
                Button("Click Me!!", action: {
                    isShowingSheet.toggle()
                })
                .frame(width:250, height: 50)
                .background(.blue)
                .foregroundColor(.black)
                .cornerRadius(15)
                .sheet(isPresented: $isShowingSheet){
                    VStack {
                        Text("License Agreement")
                            .font(.title)
                            .padding(50)
                        Text("""
                                Terms and conditions go here.
                            """)
                            .padding(50)
                        Button("Dismiss",
                               action: { isShowingSheet.toggle() })
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}
