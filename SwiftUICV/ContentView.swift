//
//  ContentView.swift
//  SwiftUICV
//
//  Created by APPLE on 2021/05/19.
//

import SwiftUI

struct Box {
    var id: Int
    let title, imageUrl: String
}

struct ContentView: View {
    
    let boxes: [Box] = [
        Box(id: 0, title: "Good Stuff", imageUrl: "hand.thumbsup"),
        Box(id: 1, title: "Tech Stuff", imageUrl: "phone"),
        Box(id: 2, title: "Code Stuff", imageUrl: "qrcode"),
        Box(id: 3, title: "Photo Stuff", imageUrl: "photo"),
        Box(id: 4, title: "SwiftUI Stuff", imageUrl: "swift")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(boxes, id: \.id) { box in
                        BoxView(box: box)
                    }
                }
            }.padding(20)
            .navigationTitle(Text("Tech Posts"))
        }
    }
}

struct BoxView: View {
    
    let box: Box
    
    var body: some View {
        VStack {
            Image(systemName: box.imageUrl)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(12)
                .background(Color.green)
            Text(box.title)
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
