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
                    AsyncImageView(url: images[imageCount]) {
                        ProgressView()
                            .contentShape(Rectangle())
                            .frame(width: 200, height: 200)
                    }
                    .cornerRadius(Theme.cornerRadiusMin)
                    .tag(imageCount)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .scaledToFill()
            
            if totalImages > 1 {
                HStack {
                    ForEach(0..<totalImages, id: \.self) { count in
                        Circle()
                            .frame(width: Theme.Spacing.P.medium, height: Theme.Spacing.P.medium)
                            .foregroundStyle(selectedTab == count ? Theme.Colors.black : Theme.Colors.gray)
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
