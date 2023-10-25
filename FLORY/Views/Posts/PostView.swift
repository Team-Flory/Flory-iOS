//
//  PostView.swift
//  FLORY
//
//  Created by gourderased on 2023/10/24.
//

import SwiftUI

struct PostView: View {
    @State private var post: Post?
    
    var body: some View {
        VStack(spacing: 20) {
            if let post = post {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(post.body)
                    .font(.body)
                    .padding()
            } else {
                Text("Loading...")
            }
        }
        .onAppear(perform: fetchPost)
    }
    
    func fetchPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
                    print("Invalid URL")
                    return
                }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let fetchedPost = try JSONDecoder().decode(Post.self, from: data)
                    DispatchQueue.main.async {
                        self.post = fetchedPost
                    }
                } catch {
                    print("Failed to decode: \(error)")
                }
            } else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
