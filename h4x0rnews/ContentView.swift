//
//  ContentView.swift
//  h4x0rnews
//
//  Created by Thiago Antonio Ramalho on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    
    let posts = [
        Post(id: "1", title: "HELLO"),
        Post(id: "2", title: "BOUJOUR"),
        Post(id: "3", title: "HOLLA")
    ]
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                Text(post.title)
            }
            .navigationBarTitle("H4X0R NEWS")
        }
    }
}

struct Post: Identifiable {
    let id: String
    let title: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
