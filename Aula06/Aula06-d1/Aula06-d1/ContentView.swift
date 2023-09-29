//
//  ContentView.swift
//  Aula06-d1
//
//  Created by Student on 12/09/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView {
                    Text("Operator List")
                        .font(.title)
                    
                    ForEach(viewModel.chars, id: \.self){ op in
                        NavigationLink(destination: OpView(p : op)) {
                            Text(op.name!)
                                .foregroundColor(.blue)
                        }
                        
                        
                        
                    }
                }.onAppear(){
                    viewModel.fetch()
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
