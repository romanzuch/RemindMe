//
//  SectionView.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 07.10.23.
//

import SwiftUI

struct SectionView: View {
    
    @Environment(\.modelContext) private var modelContext
    var items: [RemindMeItem]
    
    init(items: [RemindMeItem]) {
        self.items = items
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Eingang")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items, id: \.self) { item in
                    ItemView(item: item)
                }
            }
        }
        .padding()
    }
}

#Preview {
    SectionView(items: RemindMeItem.getExampleData())
        .modelContainer(for: RemindMeItem.self, inMemory: true)
}
