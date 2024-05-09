//
//  MusicView.swift
//  Spotify
//
//  Created by Turma01-10 on 07/05/24.
//

import SwiftUI

struct MusicView: View {
    @State var name: String = ""
    @State var artist: String = ""
    @State var cover: String = ""
    var body: some View {
        ZStack{
            VStack{
                AsyncImage(url: URL(string: cover))
                { image in
                    image
                        .resizable()
                        .frame(width: 250, height: 250)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } placeholder: {
                    Color.black
                }
                VStack{
                    Text(name)
                    Text(artist)
                }.foregroundColor(.white)
                Spacer()
                HStack{
                    Spacer()
                    Image(systemName: "shuffle").resizable().frame(width: 30, height: 30)
                    Spacer()
                    Image(systemName: "backward.end.fill").resizable().frame(width: 25, height: 25)
                    Spacer()
                    Image(systemName: "play.fill").resizable().frame(width: 30, height: 30)
                    Spacer()
                    Image(systemName: "forward.end.fill").resizable().frame(width: 25, height: 25)
                    Spacer()
                    Image(systemName: "repeat").resizable().frame(width: 30, height: 30)
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
            }
        }.background(LinearGradient(gradient: Gradient(colors: [Color("verdii"), Color("pretuu")]), startPoint: .top, endPoint: .center))
    }
}

#Preview {
    MusicView()
}
