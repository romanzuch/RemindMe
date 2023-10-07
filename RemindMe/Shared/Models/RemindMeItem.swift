//
//  RemindMeItem.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 07.10.23.
//

import Foundation
import SwiftData
import CoreLocation
import SwiftUI

@Model
final class RemindMeItem {
    var itemTitle: String
    var itemDescription: String?
    var itemDateCreation: Date = Date()
    var itemDateDue: Date?
    var itemPriority: RemindMeItemPriority?
    var itemReminder: Date?
    var itemTag: RemindMeItemTag?
    
    init(itemTitle: String, itemDescription: String? = nil, itemDateCreation: Date, itemDateDue: Date? = nil, itemPriority: RemindMeItemPriority? = nil, itemReminder: Date? = nil, itemTag: RemindMeItemTag? = nil) {
        self.itemTitle = itemTitle
        self.itemDescription = itemDescription
        self.itemDateCreation = itemDateCreation
        self.itemDateDue = itemDateDue
        self.itemPriority = itemPriority
        self.itemReminder = itemReminder
        self.itemTag = itemTag
    }
}

@Model
final class RemindMeItemPriority {
    var value: ItemPriority
    
    init(value: ItemPriority) {
        self.value = value
    }
}

enum ItemPriority: String, Codable {
    case one = "PRIORITY_ONE"
    case two = "PRIORITY_TWO"
    case three = "PRIORITY_THREE"
    case four = "PRIORITY_FOUR"
}

@Model
final class RemindMeItemTag {
    var title: String
    var color: String
    
    init(title: String, color: String) {
        self.title = title
        self.color = color
    }
}
