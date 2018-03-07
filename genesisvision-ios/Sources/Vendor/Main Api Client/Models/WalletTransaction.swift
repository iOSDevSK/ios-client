//
// WalletTransaction.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class WalletTransaction: Codable {

    public enum ModelType: String, Codable { 
        case deposit = "Deposit"
        case withdraw = "Withdraw"
        case openProgram = "OpenProgram"
        case investToProgram = "InvestToProgram"
        case withdrawFromProgram = "WithdrawFromProgram"
        case profitFromProgram = "ProfitFromProgram"
        case cancelInvestmentRequest = "CancelInvestmentRequest"
        case partialInvestmentExecutionRefund = "PartialInvestmentExecutionRefund"
        case closingProgramRefund = "ClosingProgramRefund"
    }
    public enum Currency: String, Codable { 
        case undefined = "Undefined"
        case gvt = "GVT"
        case eth = "ETH"
        case btc = "BTC"
        case usd = "USD"
        case eur = "EUR"
    }
    public var id: UUID?
    public var type: ModelType?
    public var amount: Double?
    public var date: Date?
    public var walletId: UUID?
    public var currency: Currency?
    public var investmentProgram: InvestmentProgramTxInfo?
    public var investmentProgramRequest: InvestmentProgramRequestTxInfo?
    public var paymentTx: PaymentTxInfo?


    
    public init(id: UUID?, type: ModelType?, amount: Double?, date: Date?, walletId: UUID?, currency: Currency?, investmentProgram: InvestmentProgramTxInfo?, investmentProgramRequest: InvestmentProgramRequestTxInfo?, paymentTx: PaymentTxInfo?) {
        self.id = id
        self.type = type
        self.amount = amount
        self.date = date
        self.walletId = walletId
        self.currency = currency
        self.investmentProgram = investmentProgram
        self.investmentProgramRequest = investmentProgramRequest
        self.paymentTx = paymentTx
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(type, forKey: "type")
        try container.encodeIfPresent(amount, forKey: "amount")
        try container.encodeIfPresent(date, forKey: "date")
        try container.encodeIfPresent(walletId, forKey: "walletId")
        try container.encodeIfPresent(currency, forKey: "currency")
        try container.encodeIfPresent(investmentProgram, forKey: "investmentProgram")
        try container.encodeIfPresent(investmentProgramRequest, forKey: "investmentProgramRequest")
        try container.encodeIfPresent(paymentTx, forKey: "paymentTx")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        type = try container.decodeIfPresent(ModelType.self, forKey: "type")
        amount = try container.decodeIfPresent(Double.self, forKey: "amount")
        date = try container.decodeIfPresent(Date.self, forKey: "date")
        walletId = try container.decodeIfPresent(UUID.self, forKey: "walletId")
        currency = try container.decodeIfPresent(Currency.self, forKey: "currency")
        investmentProgram = try container.decodeIfPresent(InvestmentProgramTxInfo.self, forKey: "investmentProgram")
        investmentProgramRequest = try container.decodeIfPresent(InvestmentProgramRequestTxInfo.self, forKey: "investmentProgramRequest")
        paymentTx = try container.decodeIfPresent(PaymentTxInfo.self, forKey: "paymentTx")
    }
}

