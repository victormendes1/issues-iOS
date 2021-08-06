//
//  MainTableViewController.swift
//  Issues
//
//  Created by Victor Mendes on 30/07/21.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController {
    let viewModel = IssueViewModel()
    var issues = [IssueModel]()
    
    @IBOutlet weak var stateOfIssues: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        viewModel.getDataOfIssue("all")
        
        viewModel.completionHandlerIssue { [weak self] (issues, status, error) in
            if status {
                guard let self = self else { return }
                guard let _issues = issues else { return }
                self.issues = _issues
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - SegmentedControl
    @IBAction func changeStateIssue(_ sender: Any) {
        switch stateOfIssues.selectedSegmentIndex {
        case 0:
            return viewModel.getDataOfIssue("all")
        case 1:
            return viewModel.getDataOfIssue("open")
        case 2:
            return viewModel.getDataOfIssue("closed")
        default:
            break
        }
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let infoIssues = issues[indexPath.row]
        cell.titleCellLabel.text = infoIssues.title
        cell.descriptionCellLabel.layer.cornerRadius = 9
        
        if infoIssues.state == "open" {
            cell.descriptionCellLabel.text = "Open"
            cell.descriptionCellLabel.layer.backgroundColor = UIColor.systemBackground.cgColor
            cell.descriptionCellLabel.layer.borderWidth = 1
            cell.descriptionCellLabel.layer.borderColor = UIColor.systemGreen.cgColor
            cell.descriptionCellLabel.textColor = .systemGreen
        } else if infoIssues.state == "closed" {
            cell.descriptionCellLabel.text = "Closed"
            cell.descriptionCellLabel.layer.backgroundColor = UIColor.systemBackground.cgColor
            cell.descriptionCellLabel.layer.borderWidth = 1
            cell.descriptionCellLabel.layer.borderColor = UIColor.systemRed.cgColor
            cell.descriptionCellLabel.textColor = .systemRed
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        detailVC?.dataOfIssues = issues[indexPath.row]
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}
