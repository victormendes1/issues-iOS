//
//  Service.swift
//  Issues
//
//  Created by Victor Mendes on 30/07/21.
//

import Foundation
import Moya

enum Service {
    case getIssues(_ state: String)
    case getAvatarImage(_ url: String)
}

extension Service: TargetType {
    var baseURL: URL {
        switch self {
        case .getIssues:
            return URL (string: "https://api.github.com/repos/apple/swift")!
            
        case.getAvatarImage:
            return URL (string: "https://avatars.githubusercontent.com")!
        }
    }
    var path: String {
        switch self {
        case .getIssues:
            return "/issues"
        case .getAvatarImage(let imageURL):
            let urlCut = URL (string: imageURL)!
            return "/\(urlCut.path)?v=4"
        }
        
    }
    
    var method: Moya.Method { .get }
    
    var sampleData: Data { return Data() }
    
    var task: Task {
        switch self {
        case .getIssues(let state):
            return .requestParameters(parameters: ["state": state], encoding: URLEncoding.queryString)
        case .getAvatarImage:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
