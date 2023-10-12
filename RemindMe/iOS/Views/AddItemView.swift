//
//  AddItemView.swift
//  RemindMe (iOS)
//
//  Created by Roman Zuchowski on 12.10.23.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var newItemText: String = ""
    @State private var newItemDate: Date = Date()
    @State private var datePicked: Bool = false
    @State private var showDatePicker: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "circle.dotted")
            TextField(text: self.$newItemText) {
                Text("")
            }
            .textFieldStyle(.plain)
            Button(action: {
                // open the sheet for adding a reminder
            }, label: {
                Image(systemName: "info.circle")
                    .renderingMode(.template)
                    .colorMultiply(.blue)
            })
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 8)
        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.gray.opacity(0.5)), alignment: .bottom)
        .onSubmit {
            let newReminderItem: RemindMeItem = RemindMeItem(itemTitle: self.newItemText, itemDateDue: self.newItemDate)
            self.modelContext.insert(newReminderItem)
            self.resetView()
        }
    }
}

extension AddItemView {
    private func resetView() {
        self.datePicked = false
        self.newItemText = ""
    }
}

#Preview {
    AddItemView()
}

