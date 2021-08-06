//
//  ExtensionDetailView.swift
//  Issues
//
//  Created by Victor Mendes on 05/08/21.
//

import UIKit

extension DetailViewController {
// MARK: - Functions to define the appearance of the screen
    func setupAparence() {
        // Assigning the data to the property
        titleTextLabel.text = dataOfIssues.title
        authorTextLabel.text = dataOfIssues.user?.login
        createdTextLabel.text = "Commented " + convertDate(dataOfIssues.created_at!)
        
        // TextView appearance setting - Description
        descriptionTextView.text = dataOfIssues.body
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.textContainerInset = UIEdgeInsets.init(top: 10, left: 5, bottom: 10, right: 5)
        textViewConstraint.constant = self.descriptionTextView.contentSize.height
        descriptionTextView.backgroundColor = .secondarySystemBackground
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.systemFill.cgColor
        
        // User Image Appearance Setting - Avatar
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.clipsToBounds = true
        stateLabel.layer.cornerRadius = 12
        
        // State Appearance Setting
        stateLabel.text = { if dataOfIssues.state == "open" {
            stateLabel.text = "Open"
            stateLabel.layer.backgroundColor = UIColor.systemBackground.cgColor
            stateLabel.layer.borderWidth = 1
            stateLabel.layer.borderColor = UIColor.systemGreen.cgColor
            stateLabel.textColor = .systemGreen
        } else if dataOfIssues.state == "closed"{
            stateLabel.text = "Closed"
            stateLabel.layer.backgroundColor = UIColor.systemBackground.cgColor
            stateLabel.layer.borderWidth = 1
            stateLabel.layer.borderColor = UIColor.systemRed.cgColor
            stateLabel.textColor = .systemRed
        }
        return stateLabel.text
        }()
    }
    
    func convertDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let fixedDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd/MM 'at' HH:mm"
        let newDate = dateFormatter.string(from: fixedDate!)
        return newDate
    }
}
