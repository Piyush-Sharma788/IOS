
import SwiftUI

struct MeetingDetailView: View {
    let summary: MeetingSummary

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                section("AI Summary", summary.summary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Action Items")
                        .font(.headline)

                    ForEach(summary.actionItems, id: \.self) { item in
                        Label(item, systemImage: "checkmark.circle")
                    }
                }

                section("Transcript", summary.transcript)
            }
            .padding()
        }
        .navigationTitle("Meeting Notes")
    }

    private func section(_ title: String, _ text: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)

            Text(text)
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }
}
