//
// TradeViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class TradeViewModel: Codable {

    public enum Direction: String, Codable { 
        case buy = "Buy"
        case sell = "Sell"
    }
    public var id: UUID?
    public var ticket: Int64?
    public var date: Date?
    public var symbol: String?
    public var direction: Direction?
    public var price: Double?
    public var profit: Double?
    public var volume: Double?


    
    public init(id: UUID?, ticket: Int64?, date: Date?, symbol: String?, direction: Direction?, price: Double?, profit: Double?, volume: Double?) {
        self.id = id
        self.ticket = ticket
        self.date = date
        self.symbol = symbol
        self.direction = direction
        self.price = price
        self.profit = profit
        self.volume = volume
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(ticket, forKey: "ticket")
        try container.encodeIfPresent(date, forKey: "date")
        try container.encodeIfPresent(symbol, forKey: "symbol")
        try container.encodeIfPresent(direction, forKey: "direction")
        try container.encodeIfPresent(price, forKey: "price")
        try container.encodeIfPresent(profit, forKey: "profit")
        try container.encodeIfPresent(volume, forKey: "volume")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        ticket = try container.decodeIfPresent(Int64.self, forKey: "ticket")
        date = try container.decodeIfPresent(Date.self, forKey: "date")
        symbol = try container.decodeIfPresent(String.self, forKey: "symbol")
        direction = try container.decodeIfPresent(Direction.self, forKey: "direction")
        price = try container.decodeIfPresent(Double.self, forKey: "price")
        profit = try container.decodeIfPresent(Double.self, forKey: "profit")
        volume = try container.decodeIfPresent(Double.self, forKey: "volume")
    }
}

