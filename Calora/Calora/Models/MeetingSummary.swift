
import Foundation

struct MeetingSummary: Identifiable {
    let id = UUID()
    let meetingTitle: String
    let transcript: String
    let summary: String
    let actionItems: [String]
}
