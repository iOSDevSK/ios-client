//
// ProfilePublicViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ProfilePublicViewModel: Codable {

    public var id: UUID?
    public var username: String?
    public var avatar: String?
    public var country: String?


    
    public init(id: UUID?, username: String?, avatar: String?, country: String?) {
        self.id = id
        self.username = username
        self.avatar = avatar
        self.country = country
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(username, forKey: "username")
        try container.encodeIfPresent(avatar, forKey: "avatar")
        try container.encodeIfPresent(country, forKey: "country")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(UUID.self, forKey: "id")
        username = try container.decodeIfPresent(String.self, forKey: "username")
        avatar = try container.decodeIfPresent(String.self, forKey: "avatar")
        country = try container.decodeIfPresent(String.self, forKey: "country")
    }
}

