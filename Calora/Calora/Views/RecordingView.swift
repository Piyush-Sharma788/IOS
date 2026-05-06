
import SwiftUI

struct RecordingView: View {
    let meeting: Meeting

    @StateObject private var viewModel = RecordingViewModel()

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text(meeting.title)
                    .font(.title2.bold())

                Text("Record your meeting and generate AI notes.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button {
                Task {
                    if viewModel.recorder.isRecording {
                        await viewModel.stopAndProcess(meeting: meeting)
                    } else {
                        await viewModel.start()
                    }
                }
            } label: {
                Text(viewModel.recorder.isRecording ? "Stop Recording" : "Start Recording")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.recorder.isRecording ? .red : .blue)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }

            if viewModel.isProcessing {
                ProgressView("Generating AI summary...")
            }

            if let summary = viewModel.meetingSummary {
                NavigationLink("View AI Summary") {
                    MeetingDetailView(summary: summary)
                }
                .buttonStyle(.borderedProminent)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Record")
    }
}
