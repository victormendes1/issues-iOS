//
//  IssueModel.swift
//  Issues
//
//  Created by Victor Mendes on 06/08/21.
//

import Foundation

struct IssueModel: Codable {
    let url: String?
    let id: Int?
    let number: Int?
    let title: String?
    let user: User?
    let state: String?
    let locked: Bool?
    let comments: Int?
    let created_at: String?
    let updated_at: String?
    let closed_at: String?
    let author_association: String?
    let active_lock_reason: String?
    let body: String?

    enum CodingKeys: String, CodingKey {
        case url = "html_url"
        case id = "id"
        case number = "number"
        case title = "title"
        case user = "user"
        case state = "state"
        case locked = "locked"
        case comments = "comments"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case closed_at = "closed_at"
        case author_association = "author_association"
        case active_lock_reason = "active_lock_reason"
        case body = "body"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        locked = try values.decodeIfPresent(Bool.self, forKey: .locked)
        comments = try values.decodeIfPresent(Int.self, forKey: .comments)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        closed_at = try values.decodeIfPresent(String.self, forKey: .closed_at)
        author_association = try values.decodeIfPresent(String.self, forKey: .author_association)
        active_lock_reason = try values.decodeIfPresent(String.self, forKey: .active_lock_reason)
        body = try values.decodeIfPresent(String.self, forKey: .body)

    }
}


