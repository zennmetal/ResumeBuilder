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

    let cellID = "cellID"
    
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
//        // sections 0 and 3 are single-rows, with different heights based on the context to be displayed
//
//        guard section != 1 else {
//            return //number of jobs under applicant's experience
//        }
//        guard section != 2 else {
//            return //number of skills applicant has, divided by 2
//        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        // each cell will contain 2 Labels (title, and description), and a UIImage (visible for Experience section only)
        let titleLabel = UILabel(frame: CGRect(x: 30, y: 0.0, width: cell.frame.width-30, height: cell.frame.height*0.75))
        titleLabel.tag = 99
        titleLabel.text = "Title"
        titleLabel.font = titleLabel.font.withSize(23.0)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        let detailLabel = UILabel(frame: CGRect(x: 40, y: cell.frame.height-25.0, width: cell.frame.width-40, height: cell.frame.height/3))
        detailLabel.tag = 99
        detailLabel.text = "Detail"
        detailLabel.font = detailLabel.font.withSize(15.0)
        detailLabel.adjustsFontForContentSizeCategory = true
        
        let imageView = UIImageView(frame:CGRect(x:0, y:0, width: cell.frame.height*0.95, height: cell.frame.height*0.95))
        imageView.tag = 99
        
        
        cell.contentView.addSubview(titleLabel)
        cell.contentView.addSubview(detailLabel)
        
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - UITABLEVIEWCELL Extension
extension UITableViewCell {
    
}
