//
//  ContentView.swift
//  Jokes-App
//
//  Created by Terry Jason on 2023/9/7.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        NavigationView {
            List(jokesVM.jokes) { value in
                Text(value.joke)
            }
            .navigationTitle("Jokes App")
            .toolbar {
                Button {
//                    jokesVM.jokes = [] 測試 Refresh 功能是否有效
                    refreshJokes()
                } label: {
                    Text("Refresh")
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


// MARK: Networking

extension ContentView {
    
    private func refreshJokes() {
        jokesVM.getJokes()
    }
    
}
