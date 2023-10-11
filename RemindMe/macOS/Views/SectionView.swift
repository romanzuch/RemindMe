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
    
    // MARK: - Add Items Feature
    @Binding private var showAddItem: Bool
    
    init(items: [RemindMeItem], showAddItem: Binding<Bool>) {
        self.items = items
        self._showAddItem = showAddItem
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
                if self.showAddItem {
                    AddItemView(showAddItem: self.$showAddItem)
                }
                ForEach(items, id: \.self) { item in
                    ItemView(item: item)
                }
            }
        }
        .padding()
    }
}

#Preview {
    SectionView(
        items: RemindMeItem.getExampleData(),
        showAddItem: .constant(true)
    )
        .modelContainer(for: RemindMeItem.self, inMemory: true)
}
