//
//  Sections.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 07.10.23.
//

import Foundation

class Section: Hashable {
    
    var type: SectionType
    var icon: String
    
    init(type: SectionType, icon: String) {
        self.type = type
        self.icon = icon
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.type == lhs.type
    }
}

enum SectionType: String, Identifiable {
    case backlog = "SECTION_BACKLOG"
    case today = "SECTION_TODAY"
    case soon = "SECTION_SOON"
    case tags = "SECTION_TAGS"
    case completed = "SECTION_COMPLETED"
    var id: String {
        return UUID().uuidString
    }
}

class Sections {
    static let sections: [Section] = [
        Section(type: .backlog, icon: "tray"),
        Section(type: .today, icon: "calendar.day.timeline.leading"),
        Section(type: .soon, icon: "calendar"),
        Section(type: .tags, icon: "tag"),
        Section(type: .completed, icon: "checkmark")
    ]
}
