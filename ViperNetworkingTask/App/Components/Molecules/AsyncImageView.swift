//
//  AsyncImageView.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 08/05/26.
//

import SwiftUI

struct AsyncImageView<Content: View>: View {
    let url: URL?
    @ViewBuilder let placeholder: Content
    
    var body: some View {
        AsyncImage(url: url) { Image in
            Image
                .resizable()
                .scaledToFill()
        } placeholder: {
            placeholder
        }
    }
}

#Preview {
    AsyncImageView(url: URL(string: "https://picsum.photos/200/300")!) {
        EmptyView()
    }
}
