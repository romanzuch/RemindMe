//
//  HomeView.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 11.10.23.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [RemindMeItem]
    
    // MARK: - Add Item Feature
    @State private var showAddItem: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(Sections.sections, id: \.type) { section in
                    NavigationLink {
                        SectionView(
                            items: viewModel.getObjectsInSection(for: items, in: section.type),
                            showAddItem: self.$showAddItem
                        )
                    } label: {
                        HStack {
                            Image(systemName: section.icon)
                            Text(NSLocalizedString(section.type.rawValue, comment: ""))
                            Spacer()
                            Text("\(viewModel.getObjectsInSectionCount(for: items, in: section.type))")
                        }
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showAddItem = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = RemindMeItem.getExampleData().randomElement()
            modelContext.insert(newItem!)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: RemindMeItem.self, inMemory: true)
}
