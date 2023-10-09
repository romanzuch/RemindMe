//
//  ItemView.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 08.10.23.
//

import SwiftUI

struct ItemView: View {
    
    @State private var viewModel: ItemViewModel = ItemViewModel()
    @Environment(\.modelContext) private var modelContext
    @State private var showDetailsButton: Bool = false
    @State private var isHoveringButton: Bool = false
    var item: RemindMeItem
    
    init(item: RemindMeItem) {
        self.item = item
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Button(action: {
                    if let completed = item.itemIsCompleted {
                        item.itemIsCompleted = !completed
                    } else {
                        item.itemIsCompleted = true
                    }
                }, label: {
                    Image(systemName: isHoveringButton == true ? "checkmark.circle" : "circle")
                        .font(.title2)
                        .colorMultiply(isHoveringButton == true ? .blue : .gray)
                        .onHover { hover in
                            isHoveringButton = hover
                        }
                })
                .buttonStyle(.plain)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(item.itemTitle)
                    Spacer()
                    if showDetailsButton == true {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "info.circle")
                                .renderingMode(.template)
                                .colorMultiply(.blue)
                        })
                        .buttonStyle(.plain)
                    }
                }
                if (item.itemDescription != nil) {
                    Text(item.itemDescription!)
                        .colorMultiply(.gray)
                }
            }
            .padding(.bottom, 8)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.gray.opacity(0.5)), alignment: .bottom)
            .onHover { over in
                showDetailsButton = over
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    ItemView(item: RemindMeItem.getExampleData()[4])
        .modelContainer(for: RemindMeItem.self, inMemory: true)
}
