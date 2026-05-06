import SwiftUI

struct UpcomingMeetingsView: View {
    @StateObject private var viewModel = UpcomingMeetingsViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.meetings) { meeting in
                NavigationLink {
                    RecordingView(meeting: meeting)
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(meeting.title)
                            .font(.headline)

                        Text("\(meeting.startDate.formatted(date: .omitted, time: .shortened)) - \(meeting.endDate.formatted(date: .omitted, time: .shortened))")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Calora")
            .task {
                await viewModel.loadMeetings()
            }
        }
    }
}
