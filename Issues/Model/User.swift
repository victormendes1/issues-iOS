//
//  User.swift
//  Issues
//
//  Created by Victor Mendes on 09/08/21.
//

import Foundation

struct User: Codable {
    let login: String?
    let id: Int?
    let avatarURL: String?
    let html_url: String?
    let followers_url: String?
    let following_url: String?
    let type: String?
    let site_admin: Bool?
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case avatarURL = "avatar_url"
        case html_url = "html_url"
        case followers_url = "followers_url"
        case following_url = "following_url"
        case type = "type"
        case site_admin = "site_admin"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        login = try values.decodeIfPresent(String.self, forKey: .login)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        avatarURL = try values.decodeIfPresent(String.self, forKey: .avatarURL)
        html_url = try values.decodeIfPresent(String.self, forKey: .html_url)
        followers_url = try values.decodeIfPresent(String.self, forKey: .followers_url)
        following_url = try values.decodeIfPresent(String.self, forKey: .following_url)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        site_admin = try values.decodeIfPresent(Bool.self, forKey: .site_admin)
    }
    
}
