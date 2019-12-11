//
//  ResumeSectionTableViewController.swift
//  ResumeBuilder
//
//  Created by Matthew Mauro on 2019-12-09.
//
/*
 
    This View provides 4 sections for a specific applicant
 Profile
 Experience
 Skills
 References
 
*/
import UIKit

protocol ResumeSectionDelegate {
    func didSelectNewSection()
}

class ResumeSectionTableViewController: UITableViewController {

    // tableView Properties
    let cellID = "cellID"
    var selectedSection = 0
    
    // data and delegate Properties
    var sectionDetailDelegate: ResumeSectionDelegate?
    var currentApplicant:Applicant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register cell reuseIdentifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section != 1 else {
            return 3
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == 1 else {
            return 120.0
        }
        return 65.0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section != 1 else {
            return "Experience"
        }
        guard section != 2 else {
            return "Skills"
        }
        guard section != 3 else {
            return "References"
        }
        return "Profile"
    }
    
    //MARK: Cell For Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.contentView.viewWithTag(99)?.removeFromSuperview()
        cell.contentView.viewWithTag(98)?.removeFromSuperview()
        cell.contentView.viewWithTag(97)?.removeFromSuperview()
        
        // each cell will contain 2 Labels (title, and description), and a UIImage (visible for Experience section only)
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.tag = 99
        titleLabel.text = "Title"
        titleLabel.font = titleLabel.font.withSize(23.0)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textAlignment = .right
        
        let detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.tag = 98
        detailLabel.text = "Detail"
        detailLabel.font = detailLabel.font.withSize(15.0)
        detailLabel.adjustsFontForContentSizeCategory = true
        detailLabel.textAlignment = .right
        
        let imageView = UIImageView()
        imageView.tag = 97
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "kings")
        imageView.contentMode = .scaleAspectFit
        
        cell.contentView.addSubview(titleLabel)
        cell.contentView.addSubview(detailLabel)
        cell.contentView.addSubview(imageView)

        //addConstraints now that subviews are under cell heirarchy
        //trailing
        titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -5).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -15).isActive = true
        
        //leading
        imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 5).isActive = true
        
        //top
        titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 5).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7.5).isActive = true
        imageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 5).isActive = true
        
        //imageView aspect
        imageView.heightAnchor.constraint(equalToConstant: cell.frame.height*0.95).isActive = true
        imageView.addConstraint(NSLayoutConstraint(item: imageView,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: imageView,
                                                   attribute: .width,
                                                   multiplier: 1.0/1.0,
                                                   constant: 0.0))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    //MARK: Show Detail VC on Select
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = sectionDetailDelegate as? ResumeDetailViewController {
            
            // make sure applicant is the same before updating detailView
            detailVC.currentApplicant = self.currentApplicant
            
            if indexPath.section != self.selectedSection {
                //change selectedSection, call for the detaiView to update
                self.selectedSection = indexPath.section
                self.sectionDetailDelegate?.didSelectNewSection()
            }
            
            // function call to make sure the detail view is shown on iPhone in portrait mode
            splitViewController?.showDetailViewController(detailVC, sender: nil)
        }
    }
    
}

//MARK: - UITABLEVIEWCELL Extension
extension UITableViewCell {
    
}
