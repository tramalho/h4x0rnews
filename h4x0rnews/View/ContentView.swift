//
//  ContentView.swift
//  h4x0rnews
//
//  Created by Thiago Antonio Ramalho on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var network = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(network.posts) { post in
                
                NavigationLink(
                    destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            self.network.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
