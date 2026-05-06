import Foundation

final class AIService {
    func transcribeAudio(audioURL: URL) async throws -> String {
        // Contest version placeholder.
        // In production, upload audioURL to your backend.
        return """
        This is a sample meeting transcript.
        The team discussed product launch, onboarding flow, and AI summary generation.
        """
    }

    func generateSummary(from transcript: String) async throws -> MeetingSummary {
        // Replace later with OpenAI Responses API call.
        return MeetingSummary(
            meetingTitle: "Calora Meeting",
            transcript: transcript,
            summary: "The meeting focused on building the Calora iOS app, recording meetings, generating transcripts, and creating AI-powered summaries.",
            actionItems: [
                "Connect real OpenAI transcription API",
                "Improve meeting detail UI",
                "Store summaries locally using SwiftData"
            ]
        )
    }
}
