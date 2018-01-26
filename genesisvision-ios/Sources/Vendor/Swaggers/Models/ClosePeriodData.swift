//
// ClosePeriodData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ClosePeriodData: Codable {

    public var currentPeriod: Period?
    public var nextPeriod: Period?
    public var canCloseCurrentPeriod: Bool?


    
    public init(currentPeriod: Period?, nextPeriod: Period?, canCloseCurrentPeriod: Bool?) {
        self.currentPeriod = currentPeriod
        self.nextPeriod = nextPeriod
        self.canCloseCurrentPeriod = canCloseCurrentPeriod
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(currentPeriod, forKey: "currentPeriod")
        try container.encodeIfPresent(nextPeriod, forKey: "nextPeriod")
        try container.encodeIfPresent(canCloseCurrentPeriod, forKey: "canCloseCurrentPeriod")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        currentPeriod = try container.decodeIfPresent(Period.self, forKey: "currentPeriod")
        nextPeriod = try container.decodeIfPresent(Period.self, forKey: "nextPeriod")
        canCloseCurrentPeriod = try container.decodeIfPresent(Bool.self, forKey: "canCloseCurrentPeriod")
    }
}
