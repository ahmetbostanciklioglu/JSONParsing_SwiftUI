//
//  datas.swift
//  json Parse
//
//  Created by MrBostan on 3.12.2025.
//

import Foundation
import Combine

class datas: ObservableObject {
    @Published var jsonData = [datatype]()
    
    init() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: "https://api.github.com/users/hadley/orgs")!) { data, _, _ in
            do {
                guard let data else {
                    return
                }
                let fetch = try JSONDecoder().decode([datatype].self, from: data)
                
                DispatchQueue.main.async {
                    self.jsonData = fetch
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}


