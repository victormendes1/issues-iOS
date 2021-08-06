//
//  ViewModel.swift
//  Issues
//
//  Created by Victor Mendes on 05/08/21.
//

import UIKit
import Moya

class IssueViewModel {
    let networkService = MoyaProvider<Service>()
    var issueCallBack: issuesCallBack?
    var imageCallBack: imageCallBack?
    var arrIssue = [IssueModel]()
    weak var mainVC: MainTableViewController?
    weak var detailVC: DetailViewController?
    
    
    func getDataOfIssue(_ state: String) {
        networkService.request(.getIssues(state)) { result in
            switch result {
            
            case .success(let response):
                guard let issues = try? JSONDecoder().decode([IssueModel].self, from: response.data) else {
                    return print("Unable to assign response to issues") }
                self.arrIssue.append(contentsOf: issues)
                self.issueCallBack?(issues, true, "")
                
            case .failure(let error):
                print("Unable to deserialize JSON \(error)")
                self.issueCallBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func loadAvatarUser(_ imageURL: String) {
        networkService.request(.getAvatarImage(imageURL)) { result in
            switch result {
            
            case .success(let response):
                let dataImage = response.data
                let image = UIImage(data: dataImage)
                self.imageCallBack?(image!, true, "")
                
            case .failure(let error):
                print("Unable to deserialize JSON and assign to image \(error)")
                self.imageCallBack?(UIImage(named: "noimageavailable_cover")!, false, error.localizedDescription)
            }
        }
    }
    
    typealias issuesCallBack = (_ issues: [IssueModel]?, _ status: Bool, _ error: String) -> Void
    typealias imageCallBack = (_ image: UIImage?, _ status: Bool, _ error: String) -> Void
    
    func completionHandlerIssue(callBack: @escaping issuesCallBack) {
        self.issueCallBack = callBack
    }
    
    func completionHandlerAvatar(callBack: @escaping imageCallBack) {
        self.imageCallBack = callBack
    }
}
