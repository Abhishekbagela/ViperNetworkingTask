//
//  KeyValueMultilineRowView.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 08/05/26.
//

import SwiftUI

struct KeyValueMultilineRowView: View {
    let key: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(key)
                .font(.headline)
                .bold()
            Text(value)
                .font(.callout)
                .lineLimit(4)
        }
    }
}
#Preview {
    KeyValueMultilineRowView(key: "", value: "")
}
