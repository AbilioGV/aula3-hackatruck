//
//  ContentView.swift
//  Aula05-d1
//
//  Created by Student on 06/09/23.
//

import SwiftUI
import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: URL
    let description: String
}


struct ContentView: View {
    
    @State private var locais = [
        Location(name: "Japão",
                 coordinate: CLLocationCoordinate2D(latitude: 36.44360426900602, longitude: 139.6364455767013),
                 flag: URL(string:"https://www.familysearch.org/pt/wiki/img_auth.php/8/8d/Bandeira_do_Jap%C3%A3o.png")!,
                 description: "O Japão, país insular no Oceano Pacífico, tem cidades densas, palácios imperiais, parques nacionais montanhosos e milhares de santuários e templos. Os trens-bala Shinkansen conectam as principais ilhas: Kyushu (com as praias subtropicais de Okinawa), Honshu (onde ficam Tóquio e a sede do memorial da bomba atômica de Hiroshima) e Hokkaido (famosa como destino para a prática de esqui). Tóquio, a capital, é conhecida por seus arranha-céus e lojas e pela cultura pop."),
        Location(name: "Brasil",
                 coordinate: CLLocationCoordinate2D(latitude: -8.108222204375418, longitude: -55.821786872246754),
                 flag: URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png")!,
                 description: "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul. O Rio de Janeiro, simbolizado pela sua estátua de 38 metros de altura do Cristo Redentor, situada no topo do Corcovado, é famoso pelas movimentadas praias de Copacabana e Ipanema, bem como pelo imenso e animado Carnaval, com desfiles de carros alegóricos, fantasias extravagantes e samba."),
        Location(name: "Rússia",
                 coordinate: CLLocationCoordinate2D(latitude: 62.122132483381556, longitude: 95.08984397221191),
                 flag: URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/255px-Flag_of_Russia.svg.png")!,
                 description: "A Rússia é um país da Europa Oriental e do Norte da Ásia. A Rússia é o maior país do mundo em área e o nono maior em termos de população. Moscou é a capital da Rússia. O idioma oficial é o russo.")]
    
    @State private var showingFirst = false
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    @State var aux : Location = Location(name: "Brasil",
                                         coordinate: CLLocationCoordinate2D(latitude: -8.108222204375418, longitude: -55.821786872246754),
                                         flag: URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/255px-Flag_of_Russia.svg.png")!,
                                         description: "O Japão, país insular no Oceano Pacífico, tem cidades densas, palácios imperiais, parques nacionais montanhosos e milhares de santuários e templos. Os trens-bala Shinkansen conectam as principais ilhas: Kyushu (com as praias subtropicais de Okinawa), Honshu (onde ficam Tóquio e a sede do memorial da bomba atômica de Hiroshima) e Hokkaido (famosa como destino para a prática de esqui). Tóquio, a capital, é conhecida por seus arranha-céus e lojas e pela cultura pop."
    )
    var body: some View {
        VStack {
            Text("World Map")
                .font(.title)
                .fontWeight(.bold)
            Text(aux.name)
            
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Map(coordinateRegion: $region, annotationItems: locais){ l in
                
                MapAnnotation(coordinate: l.coordinate){
                    Circle().strokeBorder(.red, lineWidth: 4)
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            showingFirst = true
                            aux = l
                        }
                }
                
            }
            // .frame(width: 400, height: 300)
            HStack {
                
                ForEach(locais) { locai in
                    Button(locai.name) {
                        region.center = locai.coordinate
                        
                        aux = locai
                    }
                }
                
            }
            .sheet(isPresented: $showingFirst) {
                ZStack {
                    Color("Cinza")
                        .edgesIgnoringSafeArea(.all)
                    VStack(spacing: 50) {
                        Text(aux.name)
                            .font(.title)
                            .fontWeight(.bold)
                        AsyncImage(url: aux.flag) { phase in phase.image?
                                .resizable()
                                .frame(width:   270, height: 190)
                                .shadow(radius: 10)
                        }
                        Text(aux.description)
                            .padding(.horizontal)
                    }
                }
            }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
