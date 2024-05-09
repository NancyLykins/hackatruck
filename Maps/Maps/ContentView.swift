//
//  ContentView.swift
//  Maps
//
//  Created by Turma01-10 on 08/05/24.
//

import SwiftUI
import MapKit

struct location: Identifiable{
    var id = UUID();
    var name: String;
    var flag: String;
    var coordnate: CLLocationCoordinate2D;
    var desc: String;
}

var Locations = [
    location(name: "Florianopolis",
             flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Bandeira_de_Santa_Catarina.svg/1200px-Bandeira_de_Santa_Catarina.svg.png",
             coordnate: CLLocationCoordinate2D(
                latitude: -27.5969,
                longitude: -48.5495
             ),
             desc: "Um estado do brasil"),
]

struct ContentView: View {
    @State private var isShowingSheet = false;
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: -14.2350,
                longitude: -51.9253
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 1,
                longitudeDelta: 1
            )
        )
    )
    
    @State private var showingSheet = false
    
    var body: some View {
        ZStack{
            VStack {
                Map(position: $position){
                    ForEach(Locations){ e in
                        Annotation(e.name, coordinate: e.coordnate){
                            ZStack{
                                Image(systemName: "info.bubble.fill.rtl")
                            }.onTapGesture {
                                showingSheet.toggle()
                            }.sheet(isPresented: $showingSheet) {
                                Text(e.name)
                                AsyncImage(url: URL(string: e.flag))
                                { image in
                                    image
                                        .resizable()
                                        .frame(width: 300, height: 175)
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                } placeholder: {
                                    Color.black
                                }
                                Text(e.desc)
                            }
                        }
                        
                    }
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            VStack{
                Text("World Map")
                Spacer()
                ForEach(Locations){ l in
                    AsyncImage(url: URL(string: l.flag))
                    { image in
                        image
                            .resizable()
                            .frame(width: 100, height: 75)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    } placeholder: {
                        Color.black
                    }.onTapGesture {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: l.coordnate.latitude,
                                    longitude: l.coordnate.longitude
                                ),
                                span: MKCoordinateSpan(
                                    latitudeDelta: 1,
                                    longitudeDelta: 1
                                )
                            )
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
