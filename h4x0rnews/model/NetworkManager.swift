//
//  NetworkManager.swift
//  h4x0rnews
//
//  Created by Thiago Antonio Ramalho on 12/10/21.
//

import Foundation

class NetworkManager:ObservableObject {
    
    @Published var posts = [Post]()

    private lazy var url:URL? = {
        return URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
    }()
    
    func fetchData() {
        
        var result: ResultData? = nil
        
        if let url = url {
            let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                } else if let safeData = data {
                    
                    do {
                        
                        try result = JSONDecoder().decode(ResultData.self, from: safeData)
                        
                        if let posts = result?.hits {
                            DispatchQueue.main.async {
                                self.posts = posts
                            }
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            task.resume()
        }
    }
}
