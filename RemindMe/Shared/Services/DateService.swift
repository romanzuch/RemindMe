//
//  DateService.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 07.10.23.
//

import Foundation

class DateService {
    static func isDateTomorrow(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date()) // Get the date for tomorrow
        return calendar.isDate(date, inSameDayAs: tomorrow!)
    }
    static func getDateFormatter() -> DateFormatter {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy"
        return dateFormatter
    }
}
