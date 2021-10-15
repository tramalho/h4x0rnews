//
//  WebView.swift
//  h4x0rnews
//
//  Created by Thiago Antonio Ramalho on 13/10/21.
//
import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let url: String?
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let safeURL = url, let urlObject =  URL(string: safeURL) {
            let urlRequest = URLRequest(url: urlObject)
            uiView.load(urlRequest)
        }
    }
    
}

struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(url: "https://www.apple.com")
    }
}
