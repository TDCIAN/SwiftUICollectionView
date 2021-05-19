//
//  ContentView.swift
//  SwiftUICV
//
//  Created by APPLE on 2021/05/19.
//

import SwiftUI

struct Post {
//    let id: Int
    let id: UUID
    let username, text, imageName: String
}

struct ContentView: View {
    
    let posts: [Post] = [
//        Post(id: 0, username: "Hillary Clinton", text: "Good old bill up to his usual ways and dirty tricks", imageName: "bolt.car"),
//        Post(id: 1, username: "Obama", text: "Easy come easy go", imageName: "bus")
        Post(id: UUID(), username: "Hillary Clinton", text: "Good old bill up to his usual ways and dirty tricks", imageName: "bolt.car"),
        Post(id: UUID(), username: "Obama", text: "Easy come easy go", imageName: "bus")
    ]

    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text("Trending")
                        .padding(.leading, 0)
                        .padding(.top, 0)
                    ScrollView(.horizontal) {
                        VStack(alignment: .leading) {
                            HStack {
                                NavigationLink(
                                    destination: GroupDetailView(),
                                    label: {
//                                        Text("Navigate now!")
                                        GroupView()
                                    })
                                
                                GroupView()
                                GroupView()
                                GroupView()
                                GroupView()
                            }
                        }
                    }
                    .frame(height: 150)
                    .background(Color.red)
                }

                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }.navigationBarTitle("Groups") // 네비게이션 제목 쓸 때
        }
    }
}

struct GroupDetailView: View {
    var body: some View {
        Text("Detail View")
    }
}

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "person.crop.square.fill")
                    .renderingMode(.original)
                    .resizable()
                    .clipShape(Circle()) // 둥글게 만든다
                    .frame(width: 60, height: 60)
                    .clipped()
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.username).font(.headline)
                    Text("Posted 8 hrs ago").font(.subheadline)
                }
                .padding(.leading, 8)
            }
            .background(Color.gray)
            .padding(.leading, 16)
            .padding(.top, 16)

            Text(post.text)
                .lineLimit(nil)
                .background(Color.orange)
                .padding(.leading, 16)
                .padding(.top, 16)

            Image(systemName: post.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
                .foregroundColor(Color.green)
                .background(Color.yellow)
        }
        .background(Color.blue)
        .padding(.leading, 10)
        .padding(.bottom, -8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GroupView: View {
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Image(systemName: "person")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(15)
                    .background(Color.blue)
                    
                Text("Co-Ed Hikes of Colorado")
                    .foregroundColor(.primary)
                    .lineLimit(nil)
            }
            .frame(width: 120, height: 120)
            .padding(.leading, 0)
        }
        .background(Color.green)
    }
}
