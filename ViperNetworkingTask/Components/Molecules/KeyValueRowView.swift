//
//  KeyValueRowView.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 08/05/26.
//

import SwiftUI

struct KeyValueRowView: View {
    let key: String
    let value: String
    
    var body: some View {
        HStack(spacing: 15) {
            Text(key)
                .font(.headline)
                .bold()
            Text(value)
                .font(.callout)
        }
    }
}
#Preview {
    KeyValueRowView(key: "", value: "")
}
