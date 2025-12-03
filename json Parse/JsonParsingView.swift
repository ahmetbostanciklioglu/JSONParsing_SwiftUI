import SwiftUI
import Combine

struct JsonParsingView: View {
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

#Preview("JSON Parsing in SwiftUI") {
    JsonParsingView()
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
