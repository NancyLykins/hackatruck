//
//  ContentView.swift
//  Spotify
//
//  Created by Turma01-10 on 07/05/24.
//

import SwiftUI

struct music: Hashable {
    var name: String;
    var artist: String;
    var cover: String;
}

struct recomended: Hashable {
    var cover: String;
    var name: String;
}

var musics = [
    music(name: "Split it out", artist: "Slipknot", cover: "https://static.wikia.nocookie.net/slipknot1/images/b/b1/Spit_It_Out.jpg/revision/latest?cb=20120928034443&path-prefix=pt"),
    music(name: "Nero Fort", artist: "Slipknot", cover: "https://i.scdn.co/image/ab67616d0000b27326f20b4d67c0c7b0f137ce4f"),
    music(name: "Vermillion", artist: "Slipknot", cover: "https://i.scdn.co/image/ab67616d0000b2736b3463e7160d333ada4b175a"),
    music(name: "Kill Pop", artist: "Slipknot", cover: "https://i.scdn.co/image/ab67616d0000b2737f6dc244baaadf89605fe0b1"),
    music(name: "Custer", artist: "Slipknot", cover: "https://i.scdn.co/image/ab67616d0000b2737f6dc244baaadf89605fe0b1"),
    music(name: "Lonely Day", artist: "System Of A Down", cover: "https://i.scdn.co/image/ab67616d0000b273f5e7b2e5adaa87430a3eccff"),
    music(name: "B.Y.O.B", artist: "System Of A Down", cover: "https://i1.sndcdn.com/artworks-000168218511-xqsnkk-t500x500.jpg"),
    music(name: "Toxicity", artist: "System Of A Down", cover: "https://i.scdn.co/image/ab67616d00001e0230d45198d0c9e8841f9a9578"),
]

var recomendeds = [
    recomended(cover: "https://static.wikia.nocookie.net/slipknot1/images/b/b1/Spit_It_Out.jpg/revision/latest?cb=20120928034443&path-prefix=pt", name: "1 - One"),
    recomended(cover: "https://static.wikia.nocookie.net/slipknot1/images/b/b1/Spit_It_Out.jpg/revision/latest?cb=20120928034443&path-prefix=pt", name: "2 - Two"),
    recomended(cover: "https://static.wikia.nocookie.net/slipknot1/images/b/b1/Spit_It_Out.jpg/revision/latest?cb=20120928034443&path-prefix=pt", name: "3 - Three"),
    recomended(cover: "https://static.wikia.nocookie.net/slipknot1/images/b/b1/Spit_It_Out.jpg/revision/latest?cb=20120928034443&path-prefix=pt", name: "4 - Four"),
]

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack {
                        VStack {
                            AsyncImage(url: URL(string: "https://static.wikia.nocookie.net/slipknot1/images/b/b1/Spit_It_Out.jpg/revision/latest?cb=20120928034443&path-prefix=pt"))
                            { image in
                                image
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                            } placeholder: {
                                Color.black
                            }
                            Spacer()
                            VStack{
                                HStack{
                                    Text("Uma Playlist ae")
                                    Spacer()
                                }
                                HStack{
                                    AsyncImage(url: URL(string: "https://static.wikia.nocookie.net/slipknot1/images/b/b1/Spit_It_Out.jpg/revision/latest?cb=20120928034443&path-prefix=pt"))
                                    { image in
                                        image
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    } placeholder: {
                                        Color.black
                                    }
                                    Text("Criada por alguem")
                                    .offset(x : -15)
                                    Spacer()
                                }.offset(x : -15)
                            }
                            .foregroundColor(.white)
                            .padding(.bottom)
                            Spacer()
                            ForEach(musics, id: \.self) { m in
                                NavigationLink(destination: MusicView(name: m.name, artist: m.artist, cover: m.cover)){
                                HStack{
                                    AsyncImage(url: URL(string: m.cover))
                                    { image in
                                        image
                                            .resizable()
                                            .frame(width: 75, height: 75)
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    } placeholder: {
                                        Color.black
                                    }
                                    VStack{
                                        Text(m.name)
                                        Text(m.artist)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                }
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .foregroundColor(.black)
                                .padding(.bottom, 25)
                                
                            }
                        }
                            VStack{
                                Text("Sugeridos")
                                    .foregroundColor(.white)
                                
                                    ScrollView(.horizontal){
                                        HStack{
                                            ForEach(recomendeds, id: \.self) { rec in
                                                VStack{
                                                    AsyncImage(url: URL(string: rec.cover))
                                                    { image in
                                                        image
                                                            .resizable()
                                                            .frame(width: 200, height: 200)
                                                            .aspectRatio(contentMode: .fit)
                                                            .padding()
                                                    } placeholder: {
                                                        Color.black
                                                    }
                                                    Text(rec.name)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                    }
                                }
                            }
                    }
                }
                .padding()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color("verdii"), Color("pretuu")]), startPoint: .top, endPoint: .center))
        }
    }
}

#Preview {
    ContentView()
}
