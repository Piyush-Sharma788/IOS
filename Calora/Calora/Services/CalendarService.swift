import Foundation
import EventKit

final class CalendarService {
    private let eventStore = EKEventStore()

    func requestAccess() async throws {
        if #available(iOS 17.0, *) {
            _ = try await eventStore.requestFullAccessToEvents()
        } else {
            _ = try await eventStore.requestAccess(to: .event)
        }
    }

    func fetchTodayMeetings() -> [Meeting] {
        let start = Date()

        let end = Calendar.current.date(
            byAdding: .day,
            value: 30,
            to: start
        )!

        let predicate = eventStore.predicateForEvents(
            withStart: start,
            end: end,
            calendars: nil
        )

        return eventStore.events(matching: predicate)
            .filter { !$0.isAllDay }
            .map {
                Meeting(
                    title: $0.title ?? "Untitled Meeting",
                    startDate: $0.startDate,
                    endDate: $0.endDate,
                    calendarId: $0.calendarItemIdentifier
                )
            }
    }
}
