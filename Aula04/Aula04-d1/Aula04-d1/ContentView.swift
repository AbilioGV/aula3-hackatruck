//
//  ContentView.swift
//  Aula04-d1
//
//  Created by Student on 05/09/23.
//

import SwiftUI

struct Songs: Identifiable {
    var id: Int
    var name: String
    var artist: String
}

private var playlist = [
    Songs(id: 1, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 2, name: "Rap do naruto", artist: "Tauz"),
    Songs(id: 3, name: "Rap do kakashi", artist: "Tauz"),
    Songs(id: 4, name: "Rap do kakashi", artist: "Tauz"),
    Songs(id: 5, name: "Rap do kakashi", artist: "Tauz"),
    Songs(id: 6, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 7, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 8, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 9, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 10, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 11, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 12, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 13, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 14, name: "Musica 1 AAAAA", artist: "Artista"),
    Songs(id: 15, name: "Musica 1 AAAAA", artist: "Artista"),
    
]

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color("Preto")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack{
                    Image("jackboys")
                        .resizable()
                        .padding(.all)
                        .frame(width: 280, height: 280)
                        .shadow(radius: 30)
                    Text("Playlist")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    	
                    ForEach(playlist) { p in
                        HStack(alignment: .center) {
                            Image("jackboys")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text(p.name)
                                    .font(.headline)
                                Text(p.artist)
                                    .font(.footnote)
                            }
                            Spacer()
                            Image(systemName: "ellipsis")
                        }
                    }
                    Text("Sugeridos")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        
                    ScrollView(.horizontal) {
                        HStack {
                            VStack {
                                Image("jackboys")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                Text("1")
                            }
                            
                        }
                            
                    }
                }
            }
        }
        .foregroundColor(Color.white)
        //.navigationTitle("Playlist")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
