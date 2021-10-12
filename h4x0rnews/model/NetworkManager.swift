//
//  NetworkManager.swift
//  h4x0rnews
//
//  Created by Thiago Antonio Ramalho on 12/10/21.
//

import Foundation

protocol NetworkDelegate {
    func onSucess(posts: [Post])
    func onError(message: String)
}

class NetworkManager {
    
    private var delegate: NetworkDelegate? = nil
    
    private lazy var url:URL? = {
        return URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
    }()
    
    init(delegate: NetworkDelegate? = nil) {
        self.delegate = delegate
    }
    
    func fetchData() {
        
        var result: ResultData? = nil
        
        if let url = url {
            let session = URLSession(configuration: .default)
                session.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    self.delegate?.onError(message: error.localizedDescription)
                } else if let safeData = data {
                    
                    do {
                        
                        try result = JSONDecoder().decode(ResultData.self, from: safeData)
                        
                        if let posts = result?.hits {
                            self.delegate?.onSucess(posts: posts)
                        }
                        
                    } catch {
                        self.delegate?.onError(message: error.localizedDescription)
                    }
                }
            }
        }
    }
}
