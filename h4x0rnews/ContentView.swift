//
//  ContentView.swift
//  h4x0rnews
//
//  Created by Thiago Antonio Ramalho on 12/10/21.
//

import SwiftUI

struct ContentView: View, NetworkDelegate {
    func onSucess(posts: [Post]) {
        //posts.append(contentsOf: posts)
    }
    
    func onError(message: String) {
        
    }
    
    private var posts: [Post] = []
    
    private lazy var networkManager: NetworkManager = {
        let network = NetworkManager(delegate: self)
        return network
    }()
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                Text(post.title)
            }
            .navigationBarTitle("H4X0R NEWS")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
