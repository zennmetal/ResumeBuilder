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

class ResumeSectionTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // each cell will contain 2 Labels (title, and description), and a UIImage (visible for Experience section only)
        
        
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
