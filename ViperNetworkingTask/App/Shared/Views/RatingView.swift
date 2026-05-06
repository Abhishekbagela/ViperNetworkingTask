//
//  RatingView.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 05/05/26.
//

import SwiftUI

struct RatingView: View {
    let label: String
    let rating: Int
    var alignment: Position = .leading
    
    enum Position {
        case leading
        case trailing
    }
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .bold()
            if alignment == .trailing {
                Spacer()
            }
            ForEach(0..<rating, id:\ .self) { count in
                HStack(spacing: -5) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .trailing)
                }
            }
        }
    }
}

#Preview {
    RatingView(label: "", rating: 0, alignment: .leading)
}
