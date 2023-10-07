//
//  SectionView.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 07.10.23.
//

import SwiftUI

struct SectionView: View {
    
    var items: [RemindMeItem]
    
    init(items: [RemindMeItem]) {
        self.items = items
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Eingang")
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "circle")
                        })
                        .buttonStyle(.plain)
                        Text(item.itemTitle)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
        }
        .padding()
    }
}

#Preview {
    SectionView(items: RemindMeItem.getExampleData())
}
