import Foundation

extension String {
    var prismaPreferredCallsignLeadingGraphemeUppercasedWithRemainderPreservedStem: String {
        guard let prismaFirstCharacterProbe = first else { return self }
        if !prismaFirstCharacterProbe.isLetter { return self }
        let prismaUppercasedLeadingGraphemeFragment = String(prismaFirstCharacterProbe).uppercased(with: Locale.current)
        if String(prismaFirstCharacterProbe) == prismaUppercasedLeadingGraphemeFragment { return self }
        return prismaUppercasedLeadingGraphemeFragment + dropFirst()
    }
}
