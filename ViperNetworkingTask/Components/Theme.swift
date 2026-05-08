//
//  Theme.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 08/05/26.
//

import Foundation
import SwiftUI

enum Theme {
    
    static var cornerRadiusMin: CGFloat = 8
    static var cornerRadiusMax: CGFloat = 16
    
    enum Colors {
        static let gray = Color.gray
        static let lightGray = Color.gray.opacity(0.5)
        static let green = Color.green
        static let black = Color.black
        static let clear = Color.clear
    }
    
    enum Typography {
        /// callout
        static let small = Font.callout
        /// caption
        static let medium = Font.caption
        /// title2
        static let big = Font.title2
        /// title
        static let title = Font.title
        /// headline
        static let headline = Font.headline
        /// subheadline
        static let subheadline = Font.subheadline
    }
    
    enum Spacing {
        
        /// Negative
        enum N {
            /// -5
            static let big: CGFloat = -5
            /// -10
            static let medium: CGFloat = -10
            /// -15
            static let small: CGFloat = -15
            /// -20
            static let verySmall: CGFloat = -20
        }
        
        /// Positive
        enum P {
            /// 5
            static let small: CGFloat = 5
            /// 10
            static let medium: CGFloat = 10
            /// 15
            static let big: CGFloat = 15
            /// 20
            static let veryBig: CGFloat = 20
        }
    }
    
    enum Positions {
        
        enum HorizontalAlignments {
            /// leading
            static let left = HorizontalAlignment.leading
            /// trailing
            static let right = HorizontalAlignment.trailing
            /// center
            static let center = HorizontalAlignment.center
        }
        
        enum VerticalAlignments {
            /// leading
            static let left = Alignment.leading
            /// trailing
            static let right = Alignment.trailing
            /// center
            static let center = Alignment.center
            /// top
            static let top = Alignment.top
            /// bottom
            static let bottom = Alignment.bottom
            /// topLeading
            static let topLeading = Alignment.topLeading
            /// topTrailing
            static let topTrailing = Alignment.topTrailing
        }
        
    }
    
}
