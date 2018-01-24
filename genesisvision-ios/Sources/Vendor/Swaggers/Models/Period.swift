//
// Period.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class Period: Codable {

    public enum Status: String, Codable { 
        case planned = "Planned"
        case inProccess = "InProccess"
        case closed = "Closed"
    }
    public var id: UUID?
    public var number: Int?
    public var dateFrom: Date?
    public var dateTo: Date?
    public var status: Status?
    public var startBalance: Double?
    public var investmentRequest: [InvestmentRequest]?


    
    public init(id: UUID?, number: Int?, dateFrom: Date?, dateTo: Date?, status: Status?, startBalance: Double?, investmentRequest: [InvestmentRequest]?) {
        self.id = id
        self.number = number
        self.dateFrom = dateFrom
        self.dateTo = dateTo
        self.status = status
        self.startBalance = startBalance
        self.investmentRequest = investmentRequest
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(number, forKey: "number")
        try container.encodeIfPresent(dateFrom, forKey: "dateFrom")
        try container.encodeIfPresent(dateTo, forKey: "dateTo")
        try container.encodeIfPresent(status, forKey: "status")
        try container.encodeIfPresent(startBalance, forKey: "startBalance")
        try container.encodeIfPresent(investmentRequest, forKey: "investmentRequest")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        number = try container.decodeIfPresent(Int.self, forKey: "number")
        dateFrom = try container.decodeIfPresent(Date.self, forKey: "dateFrom")
        dateTo = try container.decodeIfPresent(Date.self, forKey: "dateTo")
        status = try container.decodeIfPresent(Status.self, forKey: "status")
        startBalance = try container.decodeIfPresent(Double.self, forKey: "startBalance")
        investmentRequest = try container.decodeIfPresent([InvestmentRequest].self, forKey: "investmentRequest")
    }
}

