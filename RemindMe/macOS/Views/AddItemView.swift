//
//  AddItemView.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 11.10.23.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var newItemText: String = ""
    @State private var newItemDate: Date? = nil
    @State private var hoverAddDateMenu: Bool = false
    @State private var hoverAddLocationMenu: Bool = false
    @Binding private var showAddItem: Bool
    
    init(showAddItem: Binding<Bool>) {
        self._showAddItem = showAddItem
    }
    
    var body: some View {
        VStack {
            TextField(text: self.$newItemText) {
                Text("")
            }
            .textFieldStyle(.plain)
            .onExitCommand(perform: {
                self.showAddItem = false
            })
            HStack {
                if newItemDate == nil {
                    addDateMenu
                } else {
                    selectedDateButton
                }
                Spacer()
            }
        }
        .padding(.leading, 32)
        .padding(.bottom, 8)
        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.gray.opacity(0.5)), alignment: .bottom)
        .onSubmit {
            let newReminderItem: RemindMeItem = RemindMeItem(itemTitle: self.newItemText, itemDateDue: self.newItemDate)
            self.modelContext.insert(newReminderItem)
            self.showAddItem = false
        }
    }
    
    var selectedDateButton: some View {
        Button(action: {
            self.newItemDate = nil
        }, label: {
            HStack {
                Text(self.newItemDate ?? Date(), style: .date)
                Image(systemName: "xmark")
                    .renderingMode(.template)
                    .colorMultiply(hoverAddDateMenu == true ? Color.red : Color.white)
            }
        })
            .buttonStyle(.plain)
            .padding(.vertical, 4)
            .padding(.horizontal, 12)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white.opacity(0.1))
            }
            .fixedSize()
            .onHover(perform: { hovering in
                hoverAddDateMenu = hovering
            })
    }
    
    var addDateMenu: some View {
        Menu {
            VStack {
                Text("Vorschläge")
                    .font(.caption)
                Button(action: {
                    self.newItemDate = Date()
                }, label: {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Heute")
                    }
                })
                Button(action: {
                    if let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: Date()) {
                        self.newItemDate = nextDay
                    }
                }, label: {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Morgen")
                    }
                })
                Button(action: {
                    let calendar: Calendar = Calendar.current
                    let currentDayOfWeek = calendar.component(.weekday, from: Date())
                    let daysUntilSaturday = 7 - currentDayOfWeek
                    if let weekend = calendar.date(byAdding: .day, value: daysUntilSaturday, to: Date()) {
                        self.newItemDate = weekend
                    }
                }, label: {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Wochenende")
                    }
                })
            }
        } label: {
            Label("ADD_DATE", systemImage: "calendar")
        }
        .menuStyle(.borderlessButton)
        .menuIndicator(.hidden)
        .padding(.vertical, 4)
        .padding(.horizontal, 12)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.white.opacity(0.1))
        }
        .fixedSize()
        .onHover(perform: { hovering in
            self.hoverAddDateMenu = hovering
        })
    }
}

#Preview {
    AddItemView(showAddItem: .constant(true))
}
