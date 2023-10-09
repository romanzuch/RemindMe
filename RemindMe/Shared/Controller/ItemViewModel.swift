//
//  ItemViewModel.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 09.10.23.
//

import Foundation
import SwiftData

class ItemViewModel {
    func restoreItem(item: RemindMeItem, to context: ModelContext) {
        item.itemIsCompleted = true
        context.insert(item)
    }
}
