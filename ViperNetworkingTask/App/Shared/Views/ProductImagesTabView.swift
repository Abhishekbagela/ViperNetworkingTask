//
//  ProductImagesTabView.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 05/05/26.
//

import SwiftUI

struct ProductImagesTabView: View {
    let images: [URL?]
    @State var selectedTab: Int = 0
    
    var totalImages: Int {
        images.count
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(0..<totalImages, id: \.self) { imageCount in
                    AsyncImageDownloader(url: images[imageCount])
                        .tag(imageCount)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .scaledToFill()
            
            if totalImages > 1 {
                HStack {
                    ForEach(0..<totalImages, id: \.self) { count in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(selectedTab == count ? .black : .gray)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    selectedTab = count
                                }
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    ProductImagesTabView(images: [], selectedTab: 0)
}
