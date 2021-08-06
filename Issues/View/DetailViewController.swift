//
//  DetailViewController.swift
//  Issues
//
//  Created by Victor Mendes on 31/07/21.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    let viewModel = IssueViewModel()
    var dataOfIssues: IssueModel!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var textViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var authorTextLabel: UILabel!
    @IBOutlet weak var createdTextLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadAvatarUser((dataOfIssues.user?.avatarURL)!)
        viewModel.completionHandlerAvatar { [weak self] (image, status, error) in
            if status {
                guard let self = self else { return }
                guard let _image = image else { return }
                self.avatarImage.image = _image
            }
        }
        setupAparence()
    }
    
    // Open the issue in browser
    @IBAction func openURLButton(_ sender: Any) {
        let safariViewController = SFSafariViewController(url: URL(string: dataOfIssues.url!)!)
        present(safariViewController, animated: true)
    }
}
