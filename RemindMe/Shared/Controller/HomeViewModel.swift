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
            let uncompletedData = data.compactMap { item in
                if item.itemIsCompleted == nil || item.itemIsCompleted == false {
                    return item
                }
                return nil
            }
            return uncompletedData
        case .today:
            let todayItems = data.compactMap { item in
                if item.itemIsCompleted == nil || item.itemIsCompleted == false {
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
                return nil
            }
            return todayItems
        case .soon:
            let soonItems = data.compactMap { item in
                if item.itemIsCompleted == nil || item.itemIsCompleted == false {
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
                return nil
            }
            return soonItems
        case .tags:
            let tagsItems = data.compactMap { item in
                if item.itemIsCompleted == nil || item.itemIsCompleted == false {
                    if item.itemTag != nil {
                        return item
                    } else {
                        return nil
                    }
                }
                return nil
            }
            return tagsItems
        case .completed:
            let completedItems = data.compactMap { item in
                if item.itemIsCompleted == true { return item }
                return nil
            }
            return completedItems
        }
    }
}
