//
// InvestmentProgramsFilter.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class InvestmentProgramsFilter: Codable {

    public enum Sorting: String, Codable { 
        case byLevelAsc = "ByLevelAsc"
        case byLevelDesc = "ByLevelDesc"
        case byProfitAsc = "ByProfitAsc"
        case byProfitDesc = "ByProfitDesc"
        case byOrdersAsc = "ByOrdersAsc"
        case byOrdersDesc = "ByOrdersDesc"
        case byEndOfPeriodAsk = "ByEndOfPeriodAsk"
        case byEndOfPeriodDesc = "ByEndOfPeriodDesc"
    }
    public enum ProfitTotalChange: String, Codable { 
        case unchanged = "Unchanged"
        case up = "Up"
        case down = "Down"
    }
    public var managerId: UUID?
    public var brokerId: UUID?
    public var brokerTradeServerId: UUID?
    public var investMaxAmountFrom: Double?
    public var investMaxAmountTo: Double?
    public var sorting: Sorting?
    public var name: String?
    public var levelMin: Int?
    public var levelMax: Int?
    public var profitAvgMin: Int?
    public var profitAvgMax: Int?
    public var profitTotalMin: Int?
    public var profitTotalMax: Int?
    public var profitTotalPercentMin: Int?
    public var profitTotalPercentMax: Int?
    public var profitAvgPercentMin: Int?
    public var profitAvgPercentMax: Int?
    public var profitTotalChange: ProfitTotalChange?
    public var periodMin: Int?
    public var periodMax: Int?
    public var skip: Int?
    public var take: Int?


    
    public init(managerId: UUID?, brokerId: UUID?, brokerTradeServerId: UUID?, investMaxAmountFrom: Double?, investMaxAmountTo: Double?, sorting: Sorting?, name: String?, levelMin: Int?, levelMax: Int?, profitAvgMin: Int?, profitAvgMax: Int?, profitTotalMin: Int?, profitTotalMax: Int?, profitTotalPercentMin: Int?, profitTotalPercentMax: Int?, profitAvgPercentMin: Int?, profitAvgPercentMax: Int?, profitTotalChange: ProfitTotalChange?, periodMin: Int?, periodMax: Int?, skip: Int?, take: Int?) {
        self.managerId = managerId
        self.brokerId = brokerId
        self.brokerTradeServerId = brokerTradeServerId
        self.investMaxAmountFrom = investMaxAmountFrom
        self.investMaxAmountTo = investMaxAmountTo
        self.sorting = sorting
        self.name = name
        self.levelMin = levelMin
        self.levelMax = levelMax
        self.profitAvgMin = profitAvgMin
        self.profitAvgMax = profitAvgMax
        self.profitTotalMin = profitTotalMin
        self.profitTotalMax = profitTotalMax
        self.profitTotalPercentMin = profitTotalPercentMin
        self.profitTotalPercentMax = profitTotalPercentMax
        self.profitAvgPercentMin = profitAvgPercentMin
        self.profitAvgPercentMax = profitAvgPercentMax
        self.profitTotalChange = profitTotalChange
        self.periodMin = periodMin
        self.periodMax = periodMax
        self.skip = skip
        self.take = take
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(managerId, forKey: "managerId")
        try container.encodeIfPresent(brokerId, forKey: "brokerId")
        try container.encodeIfPresent(brokerTradeServerId, forKey: "brokerTradeServerId")
        try container.encodeIfPresent(investMaxAmountFrom, forKey: "investMaxAmountFrom")
        try container.encodeIfPresent(investMaxAmountTo, forKey: "investMaxAmountTo")
        try container.encodeIfPresent(sorting, forKey: "sorting")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(levelMin, forKey: "levelMin")
        try container.encodeIfPresent(levelMax, forKey: "levelMax")
        try container.encodeIfPresent(profitAvgMin, forKey: "profitAvgMin")
        try container.encodeIfPresent(profitAvgMax, forKey: "profitAvgMax")
        try container.encodeIfPresent(profitTotalMin, forKey: "profitTotalMin")
        try container.encodeIfPresent(profitTotalMax, forKey: "profitTotalMax")
        try container.encodeIfPresent(profitTotalPercentMin, forKey: "profitTotalPercentMin")
        try container.encodeIfPresent(profitTotalPercentMax, forKey: "profitTotalPercentMax")
        try container.encodeIfPresent(profitAvgPercentMin, forKey: "profitAvgPercentMin")
        try container.encodeIfPresent(profitAvgPercentMax, forKey: "profitAvgPercentMax")
        try container.encodeIfPresent(profitTotalChange, forKey: "profitTotalChange")
        try container.encodeIfPresent(periodMin, forKey: "periodMin")
        try container.encodeIfPresent(periodMax, forKey: "periodMax")
        try container.encodeIfPresent(skip, forKey: "skip")
        try container.encodeIfPresent(take, forKey: "take")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        managerId = try container.decodeIfPresent(UUID.self, forKey: "managerId")
        brokerId = try container.decodeIfPresent(UUID.self, forKey: "brokerId")
        brokerTradeServerId = try container.decodeIfPresent(UUID.self, forKey: "brokerTradeServerId")
        investMaxAmountFrom = try container.decodeIfPresent(Double.self, forKey: "investMaxAmountFrom")
        investMaxAmountTo = try container.decodeIfPresent(Double.self, forKey: "investMaxAmountTo")
        sorting = try container.decodeIfPresent(Sorting.self, forKey: "sorting")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        levelMin = try container.decodeIfPresent(Int.self, forKey: "levelMin")
        levelMax = try container.decodeIfPresent(Int.self, forKey: "levelMax")
        profitAvgMin = try container.decodeIfPresent(Int.self, forKey: "profitAvgMin")
        profitAvgMax = try container.decodeIfPresent(Int.self, forKey: "profitAvgMax")
        profitTotalMin = try container.decodeIfPresent(Int.self, forKey: "profitTotalMin")
        profitTotalMax = try container.decodeIfPresent(Int.self, forKey: "profitTotalMax")
        profitTotalPercentMin = try container.decodeIfPresent(Int.self, forKey: "profitTotalPercentMin")
        profitTotalPercentMax = try container.decodeIfPresent(Int.self, forKey: "profitTotalPercentMax")
        profitAvgPercentMin = try container.decodeIfPresent(Int.self, forKey: "profitAvgPercentMin")
        profitAvgPercentMax = try container.decodeIfPresent(Int.self, forKey: "profitAvgPercentMax")
        profitTotalChange = try container.decodeIfPresent(ProfitTotalChange.self, forKey: "profitTotalChange")
        periodMin = try container.decodeIfPresent(Int.self, forKey: "periodMin")
        periodMax = try container.decodeIfPresent(Int.self, forKey: "periodMax")
        skip = try container.decodeIfPresent(Int.self, forKey: "skip")
        take = try container.decodeIfPresent(Int.self, forKey: "take")
    }
}

