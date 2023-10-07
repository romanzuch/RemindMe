//
//  HomeViewModel.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 07.10.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    func getObjectsInSectionCount(for data: [RemindMeItem], in section: SectionType) -> Int {
        return getObjectsInSection(for: data, in: section).count
    }
    
    func getObjectsInSection(for data: [RemindMeItem], in section: SectionType) -> [RemindMeItem] {
        let dateFormatter: DateFormatter = DateService.getDateFormatter()
        switch section {
        case .backlog:
            return data
        case .today:
            let todayItems = data.compactMap { item in
                if let dueDate = item.itemDateDue {
                    let formattedDate: String = dateFormatter.string(from: dueDate)
                    if formattedDate == dateFormatter.string(from: Date()) {
                        return item
                    } else {
                        return nil
                    }
                } else {
                    return nil
                }
            }
            return todayItems
        case .soon:
            let soonItems = data.compactMap { item in
                if let dueDate = item.itemDateDue {
                    if (DateService.isDateTomorrow(dueDate)) {
                        return item
                    } else {
                        return nil
                    }
                } else {
                    return nil
                }
            }
            return soonItems
        case .tags:
            let tagsItems = data.compactMap { item in
                if let tag = item.itemTag {
                    return item
                } else {
                    return nil
                }
            }
            return tagsItems
        }
    }
}
