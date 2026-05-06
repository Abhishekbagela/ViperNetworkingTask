//
//  AsyncImageDownloader.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 05/05/26.
//

import SwiftUI

struct AsyncImageDownloader: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { Image in
            Image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
                .contentShape(Rectangle())
                .frame(width: 200, height: 200)
        }
        .cornerRadius(8)
    }
}

#Preview {
    AsyncImageDownloader(url: URL(string: "https://picsum.photos/200/300")!)
}
