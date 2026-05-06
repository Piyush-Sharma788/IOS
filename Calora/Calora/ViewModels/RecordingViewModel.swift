import Foundation
import Combine

@MainActor
final class RecordingViewModel: ObservableObject {
    @Published var isProcessing = false
    @Published var meetingSummary: MeetingSummary?

    let recorder = AudioRecordingService()
    private let aiService = AIService()

    func start() async {
        let allowed = await recorder.requestPermission()
        guard allowed else { return }

        do {
            try recorder.startRecording()
        } catch {
            print(error.localizedDescription)
        }
    }

    func stopAndProcess(meeting: Meeting) async {
        recorder.stopRecording()

        guard let url = recorder.audioURL else { return }

        isProcessing = true
        defer { isProcessing = false }

        do {
            let transcript = try await aiService.transcribeAudio(audioURL: url)
            meetingSummary = try await aiService.generateSummary(from: transcript)
        } catch {
            print(error.localizedDescription)
        }
    }
}
