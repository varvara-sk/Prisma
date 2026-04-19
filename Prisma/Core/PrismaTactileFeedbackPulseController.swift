import UIKit

enum PrismaTactileFeedbackPulseController {
    static func prismaEmitLightImpactPulse() {
        let prismaFeedbackGeneratorInstance = UIImpactFeedbackGenerator(style: .light)
        prismaFeedbackGeneratorInstance.prepare()
        prismaFeedbackGeneratorInstance.impactOccurred()
    }

    static func prismaEmitSuccessfulCheckpointImpactPulse() {
        let prismaFeedbackGeneratorInstance = UIImpactFeedbackGenerator(style: .medium)
        prismaFeedbackGeneratorInstance.prepare()
        prismaFeedbackGeneratorInstance.impactOccurred()
    }
}
