//
//  SectionView.swift
//  RemindMe (iOS)
//
//  Created by Roman Zuchowski on 07.10.23.
//

import SwiftUI

struct SectionView: View {
    
    @Environment(\.modelContext) private var modelContext
    var items: [RemindMeItem]
    var title: String
    
    init(title: String, items: [RemindMeItem]) {
        self.title = title
        self.items = items
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(NSLocalizedString(title, comment: ""))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Spacer()
            }
            ScrollView {
                ForEach(items, id: \.hashValue) { item in
                    ItemView(item: item)
                }
                AddItemView()
            }
        }
    }
}

#Preview {
    SectionView(title: "Eingang", items: RemindMeItem.getExampleData())
        .modelContainer(for: RemindMeItem.self, inMemory: true)
}
