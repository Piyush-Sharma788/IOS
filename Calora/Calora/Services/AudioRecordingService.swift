import Foundation
import AVFoundation
import Combine

final class AudioRecordingService: NSObject, ObservableObject {
    private var recorder: AVAudioRecorder?

    @Published var isRecording = false
    @Published var audioURL: URL?

    func requestPermission() async -> Bool {
        await AVAudioApplication.requestRecordPermission()
    }

    func startRecording() throws {
        let filename = UUID().uuidString + ".m4a"
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(filename)

        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44_100,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        recorder = try AVAudioRecorder(url: url, settings: settings)
        recorder?.record()

        audioURL = url
        isRecording = true
    }

    func stopRecording() {
        recorder?.stop()
        recorder = nil
        isRecording = false
    }
}
