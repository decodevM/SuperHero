//
//  ContentView.swift
//  SuperHero
//
//  Created by Inconnu on 8/29/23.
//

import SwiftUI

struct ContentView: View {
    let _superHeros :[SuperHeroModel] = superHeros;
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(_superHeros){ item in
                    SuperHeroView(superHero: item)
                        .padding()
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
