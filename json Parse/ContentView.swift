//
//  ContentView.swift
//  json Parse
//
//  Created by MrBostan on 3.12.2025.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var getData = datas()
    
    var body: some View {
        NavigationView {
            List(getData.jsonData) { i in
                ListRow(url: i.avatar_url, title: i.login)
            }
            .navigationTitle("json Parsing")
        }
    }
}

#Preview {
    ContentView()
}

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

struct datatype: Identifiable, Decodable {
    var id: Int
    var login: String
    var node_id: String
    var avatar_url: String
}

struct ListRow: View {
    var url: String
    var title: String
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: url)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure:
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.secondary)
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(title)
                .font(.body)
        }
        .padding(.vertical, 6)
    }
}
