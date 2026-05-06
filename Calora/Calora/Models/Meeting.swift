
import Foundation

struct Meeting: Identifiable {
    let id = UUID()
    let title: String
    let startDate: Date
    let endDate: Date
    let calendarId: String?
}
