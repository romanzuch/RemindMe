//
//  HomeView.swift
//  RemindMe (iOS)
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
    @State private var showAddItemView: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(Sections.sections, id: \.type) { section in
                    NavigationLink {
                        SectionView(title: section.type.rawValue, items: viewModel.getObjectsInSection(for: items, in: section.type)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(action: addItem) {
                            HStack {
                                Image(systemName: "plus")
                                    .fontWeight(.bold)
                                Text("Hinzufügen")
                            }
                            .font(.title2)
                        }
                        Spacer()
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: self.$showAddItemView, content: {
            Text("Hallo")
        })
    }
    
    private func addItem() {
        self.showAddItemView.toggle()
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
