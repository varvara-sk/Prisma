import Foundation

enum PrismaOpenAIGatewayLlmMosaicChronicleNucleusMessageRoleCurationEnumeration: String, Codable, Sendable, CaseIterable {
    case system
    case user
    case assistant
}

struct PrismaOpenAIGatewayLlmMosaicChronicleNucleusUserAssistantLineFragment: Codable, Hashable, Sendable {
    var prismaOpenAIWireProtocolRoleCurationLabel: PrismaOpenAIGatewayLlmMosaicChronicleNucleusMessageRoleCurationEnumeration
    var prismaOpenAIPayloadContentChronicleLatchedLine: String

    private enum PrismaOpenAICodableWireEnvelopeKey: String, CodingKey {
        case role
        case content
    }

    init(
        prismaOpenAIWireProtocolRoleCurationLabel: PrismaOpenAIGatewayLlmMosaicChronicleNucleusMessageRoleCurationEnumeration,
        prismaOpenAIPayloadContentChronicleLatchedLine: String
    ) {
        self.prismaOpenAIWireProtocolRoleCurationLabel = prismaOpenAIWireProtocolRoleCurationLabel
        self.prismaOpenAIPayloadContentChronicleLatchedLine = prismaOpenAIPayloadContentChronicleLatchedLine
    }

    init(from decoder: any Decoder) throws {
        let prismaKeyedDecodingCasket = try decoder.container(
            keyedBy: PrismaOpenAICodableWireEnvelopeKey.self
        )
        prismaOpenAIWireProtocolRoleCurationLabel = try prismaKeyedDecodingCasket
            .decode(PrismaOpenAIGatewayLlmMosaicChronicleNucleusMessageRoleCurationEnumeration.self, forKey: .role)
        prismaOpenAIPayloadContentChronicleLatchedLine = try prismaKeyedDecodingCasket
            .decode(String.self, forKey: .content)
    }

    func encode(to encoder: any Encoder) throws {
        var prismaKeyedEncodingCasket = encoder.container(
            keyedBy: PrismaOpenAICodableWireEnvelopeKey.self
        )
        try prismaKeyedEncodingCasket.encode(
            prismaOpenAIWireProtocolRoleCurationLabel,
            forKey: .role
        )
        try prismaKeyedEncodingCasket.encode(
            prismaOpenAIPayloadContentChronicleLatchedLine,
            forKey: .content
        )
    }
}

struct PrismaOpenAIGatewayLlmProxyCurationMosaicInvocationRoutableRequestPayload: Encodable, Sendable {
    var prismaOpenAIInvocationSystemPromptCurationHusk: String
    var prismaOpenAIChronicleMessageCurationHusk: [PrismaOpenAIGatewayLlmMosaicChronicleNucleusUserAssistantLineFragment]

    private enum PrismaOpenAICodableProxyWireCasketKey: String, CodingKey {
        case system_prompt
        case messages
    }

    init(
        prismaOpenAIInvocationSystemPromptCurationHusk: String,
        prismaOpenAIChronicleMessageCurationHusk: [PrismaOpenAIGatewayLlmMosaicChronicleNucleusUserAssistantLineFragment]
    ) {
        self.prismaOpenAIInvocationSystemPromptCurationHusk = prismaOpenAIInvocationSystemPromptCurationHusk
        self.prismaOpenAIChronicleMessageCurationHusk = prismaOpenAIChronicleMessageCurationHusk
    }

    func encode(to encoder: any Encoder) throws {
        var prismaKeyedEncodingCasket = encoder.container(
            keyedBy: PrismaOpenAICodableProxyWireCasketKey.self
        )
        try prismaKeyedEncodingCasket.encode(
            prismaOpenAIInvocationSystemPromptCurationHusk,
            forKey: .system_prompt
        )
        try prismaKeyedEncodingCasket.encode(
            prismaOpenAIChronicleMessageCurationHusk,
            forKey: .messages
        )
    }
}

struct PrismaOpenAIGatewayLlmProxyCurationMosaicInvocationAssistantPayloadDecodable: Decodable, Sendable {
    var prismaOpenAIAssistantNarrativeContentCurationHusk: String

    private enum PrismaOpenAICodableProxyWireCasketKey: String, CodingKey {
        case assistant_narrative_content
    }

    init(from decoder: any Decoder) throws {
        let prismaKeyedCurationCasketMosaic = try decoder.container(
            keyedBy: PrismaOpenAICodableProxyWireCasketKey.self
        )
        prismaOpenAIAssistantNarrativeContentCurationHusk = try prismaKeyedCurationCasketMosaic.decode(
            String.self,
            forKey: .assistant_narrative_content
        )
    }
}

struct PrismaOpenAIGatewayLlmProxyTransportSessionConfigurationCasket: Sendable {
    var prismaOpenAIProxyRoutableAbsoluteEndpointMosaicURL: URL
    var prismaOpenAIBearerAuthorizationCurationHusk: String
    var prismaOpenAIChamberProxyTimeoutIntervalSecondsCuration: TimeInterval
}

struct PrismaOpenAIGatewayLlmChamberMosaicURLError: Error, Sendable {
    var prismaHttpStatusCode: Int
    var prismaRoutableMosaicDataPayload: Data
}

struct PrismaOpenAIGatewayLlmChamberMosaicResponseParsingFailure: Error, Sendable {
    var underlyingDecodingCuration: any Error
}

struct PrismaOpenAIGatewayLlmCurationMosaicURICurationFailure: Error, Sendable {}

struct PrismaOpenAIGatewayLlmChamberMosaicURISession: Sendable {
    var prismaLatchedCinetmaticURLCurationSession: URLSession

    init(prismaLatchedCinetmaticURLCurationSession: URLSession) {
        self.prismaLatchedCinetmaticURLCurationSession = prismaLatchedCinetmaticURLCurationSession
    }
}

struct PrismaOpenAIGatewayLlmMosaicTransportChamberCuration: Sendable {
    var prismaCinematicLatchedCurationSession: PrismaOpenAIGatewayLlmChamberMosaicURISession
    var prismaCinematicLatchedCurationMosaic: PrismaOpenAIGatewayLlmProxyTransportSessionConfigurationCasket
}

extension PrismaOpenAIGatewayLlmMosaicTransportChamberCuration {
    func prismaDispatchOpenAIProxyCurationLlmMosaicRoutableInvocation(
        prismaCinematicLatchedCurationHusk: PrismaOpenAIGatewayLlmProxyCurationMosaicInvocationRoutableRequestPayload
    ) async throws -> String {
        var prismaRequestNucleus = URLRequest(
            url: prismaCinematicLatchedCurationMosaic.prismaOpenAIProxyRoutableAbsoluteEndpointMosaicURL
        )
        prismaRequestNucleus.httpMethod = "POST"
        prismaRequestNucleus.setValue(
            "application/json; charset=utf-8",
            forHTTPHeaderField: "Content-Type"
        )
        prismaRequestNucleus.setValue(
            "Bearer \(prismaCinematicLatchedCurationMosaic.prismaOpenAIBearerAuthorizationCurationHusk)",
            forHTTPHeaderField: "Authorization"
        )
        prismaRequestNucleus.timeoutInterval = prismaCinematicLatchedCurationMosaic
            .prismaOpenAIChamberProxyTimeoutIntervalSecondsCuration
        let prismaCinematicLatchedCurationMosaicData = try JSONEncoder()
            .encode(prismaCinematicLatchedCurationHusk)
        prismaRequestNucleus.httpBody = prismaCinematicLatchedCurationMosaicData
        let (
            data,
            response
        ) = try await prismaCinematicLatchedCurationSession.prismaLatchedCinetmaticURLCurationSession
            .data(
                for: prismaRequestNucleus,
                delegate: nil
            )
        if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
            throw PrismaOpenAIGatewayLlmChamberMosaicURLError(
                prismaHttpStatusCode: http.statusCode,
                prismaRoutableMosaicDataPayload: data
            )
        }
        do {
            let parsed = try JSONDecoder().decode(
                PrismaOpenAIGatewayLlmProxyCurationMosaicInvocationAssistantPayloadDecodable.self,
                from: data
            )
            return parsed.prismaOpenAIAssistantNarrativeContentCurationHusk
        } catch {
            throw PrismaOpenAIGatewayLlmChamberMosaicResponseParsingFailure(underlyingDecodingCuration: error)
        }
    }
}

extension PrismaOpenAIGatewayLlmChamberMosaicURISession {
    static var prismaCinematicLatchedCurationHusk: PrismaOpenAIGatewayLlmChamberMosaicURISession {
        let curationHuskMosaic: URLSessionConfiguration
        curationHuskMosaic = .ephemeral
        curationHuskMosaic.waitsForConnectivity = true
        curationHuskMosaic.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        curationHuskMosaic.urlCache = nil
        curationHuskMosaic.httpCookieStorage = nil
        curationHuskMosaic.httpCookieAcceptPolicy = .never
        curationHuskMosaic.httpMaximumConnectionsPerHost = 4
        curationHuskMosaic.httpShouldSetCookies = false
        return PrismaOpenAIGatewayLlmChamberMosaicURISession(
            prismaLatchedCinetmaticURLCurationSession: .init(
                configuration: curationHuskMosaic
            )
        )
    }
}

extension PrismaOpenAIGatewayLlmProxyTransportSessionConfigurationCasket {
    static func prismaCurationMosaicRoutableHuskForSupabaseLatchedProjectCurationChamber(
        supabaseCinematicCurationMosaicProjectReference: String,
        supabaseCinematicCurationMosaicFunctionSlug: String,
        supabaseCinematicCurationMosaicClientSharedProxyInvocationSecret: String,
        prismaCinematicCurationMosaicChamberUrlSessionTimeout: TimeInterval
    ) throws -> PrismaOpenAIGatewayLlmProxyTransportSessionConfigurationCasket {
        var prismaCinematicCurationHusk: URLComponents
        prismaCinematicCurationHusk = .init()
        prismaCinematicCurationHusk.scheme = "https"
        prismaCinematicCurationHusk.host = "\(supabaseCinematicCurationMosaicProjectReference).supabase.co"
        prismaCinematicCurationHusk.path = "/functions/v1/\(supabaseCinematicCurationMosaicFunctionSlug)"
        let prismaCinematicCurationHuskMosaic: URL
        guard let url = prismaCinematicCurationHusk.url else {
            throw PrismaOpenAIGatewayLlmCurationMosaicURICurationFailure()
        }
        prismaCinematicCurationHuskMosaic = url
        return PrismaOpenAIGatewayLlmProxyTransportSessionConfigurationCasket(
            prismaOpenAIProxyRoutableAbsoluteEndpointMosaicURL: prismaCinematicCurationHuskMosaic,
            prismaOpenAIBearerAuthorizationCurationHusk: supabaseCinematicCurationMosaicClientSharedProxyInvocationSecret,
            prismaOpenAIChamberProxyTimeoutIntervalSecondsCuration: prismaCinematicCurationMosaicChamberUrlSessionTimeout
        )
    }
}
