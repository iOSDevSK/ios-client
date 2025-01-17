//
// WalletInvestmentPrograms.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class WalletInvestmentPrograms: Codable {

    public var investmentPrograms: [WalletInvestmentProgram]?


    
    public init(investmentPrograms: [WalletInvestmentProgram]?) {
        self.investmentPrograms = investmentPrograms
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(investmentPrograms, forKey: "investmentPrograms")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        investmentPrograms = try container.decodeIfPresent([WalletInvestmentProgram].self, forKey: "investmentPrograms")
    }
}

