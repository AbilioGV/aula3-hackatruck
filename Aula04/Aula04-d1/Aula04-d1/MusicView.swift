//
//  MusicView.swift
//  Aula04-d1
//
//  Created by Student on 06/09/23.
//

import SwiftUI

struct MusicView: View {
    var body: some View {
        ZStack {
            Color("Preto")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("jackboys")
                    .resizable()
                    .padding(.all)
                    .frame(width: 280, height: 280)
                    .shadow(radius: 30)
                Text("Música")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                HStack {
                    Image(systemName: "shuffle")
                    Image(systemName: "backward.end.fill")
                    Image(systemName: "play.fill")
                    Image(systemName: "forward.end.fill")
                    Image(systemName: "repeat")
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
    
    struct MusicView_Previews: PreviewProvider {
        static var previews: some View {
            MusicView()
        }
    }
}
