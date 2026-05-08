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
    var alignment = Theme.Positions.VerticalAlignments.left
    
    enum Position {
        case leading
        case trailing
    }
    
    var body: some View {
        HStack {
            Text(label)
                .font(Theme.Typography.headline)
                .bold()
            if alignment == Theme.Positions.VerticalAlignments.right {
                Spacer()
            }
            ForEach(0..<rating, id:\ .self) { count in
                HStack(spacing: Theme.Spacing.N.verySmall) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(
                            width: Theme.Spacing.P.big,
                            height: Theme.Spacing.P.big,
                            alignment: Theme.Positions.VerticalAlignments.right
                        )
                }
            }
        }
    }
}

#Preview {
    RatingView(label: "", rating: 0, alignment: Theme.Positions.VerticalAlignments.left)
}
