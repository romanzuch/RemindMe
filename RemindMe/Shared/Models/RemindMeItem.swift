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
    var itemLocation: CLLocationCoordinate2D?
    
    init(itemTitle: String, itemDescription: String? = nil, itemDateCreation: Date, itemDateDue: Date? = nil, itemPriority: RemindMeItemPriority? = nil, itemReminder: Date? = nil, itemTag: RemindMeItemTag? = nil, itemLocation: CLLocationCoordinate2D? = nil) {
        self.itemTitle = itemTitle
        self.itemDescription = itemDescription
        self.itemDateCreation = itemDateCreation
        self.itemDateDue = itemDateDue
        self.itemPriority = itemPriority
        self.itemReminder = itemReminder
        self.itemTag = itemTag
        self.itemLocation = itemLocation
    }
}

enum RemindMeItemPriority: String {
    case one = "PRIORITY_ONE"
    case two = "PRIORITY_TWO"
    case three = "PRIORITY_THREE"
    case four = "PRIORITY_FOUR"
}

class RemindMeItemTag {
    var title: String
    var color: Color
    
    init(title: String, color: Color) {
        self.title = title
        self.color = color
    }
}
