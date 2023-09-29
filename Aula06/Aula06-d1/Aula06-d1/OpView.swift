//
//  OpView.swift
//  Aula06-d1
//
//  Created by Student on 12/09/23.
////
import SwiftUI
import Foundation

struct OpView: View {
    @StateObject var viewModel = ViewModel()
    
    var p : Operator
    
    var body: some View {
        VStack {
            ScrollView {
                Text(p.name!)
                    .font(.title)
                HStack {
                    Text("Alter:")
                    Text(p.alter!)
                }
                HStack {
                    Text("Rarity:")
                    Text(String(p.rarity!))
                }
                HStack {
                    Text("Artist:")
                    Text(p.artist!)
                }
                HStack {
                    Text("Voice Actor:")
                    Text(p.va!)
                }
//                HStack{
//                    Text("Classes:")
//                    Text(p.classe!)
//                }
                HStack{
                    Text("Headhunting:")
                    Text(p.headhunting!)
                }
                HStack{
                    Text("Recruitable:")
                    Text(p.recruitable!)
                }
                HStack{
                    Text("CN:")
                    Text(p.release_dates.cn!)
                }
                HStack{
                    Text("Global:")
                    Text(p.release_dates.global!)
                }
            }
        }
    }
}

struct OpView_Previews: PreviewProvider {
    static var previews: some View {
        OpView(p: Operator(name: "", rarity: 0, alter: "", artist: "", va: "", classe: ["",""], headhunting: "", recruitable: "", release_dates: Release(cn: "", global: "")))
    }
}
