import Foundation
import Combine

@MainActor
final class UpcomingMeetingsViewModel: ObservableObject {
    @Published var meetings: [Meeting] = []
    @Published var errorMessage: String?

    private let calendarService = CalendarService()

    func loadMeetings() async {
        do {
            try await calendarService.requestAccess()
            meetings = calendarService.fetchTodayMeetings()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
