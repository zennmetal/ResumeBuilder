//
//  ViewController.swift
//  ResumeBuilder
//
//  Created by Matthew Mauro on 2019-12-09.
//  Copyright © 2019 Matthew Mauro. All rights reserved.
//

import UIKit

class ResumeDetailViewController: UIViewController, ResumeSectionDelegate {

    var currentApplicant:Applicant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func didSelectNewSection() {
        //update self, based on selected section
    }
}

