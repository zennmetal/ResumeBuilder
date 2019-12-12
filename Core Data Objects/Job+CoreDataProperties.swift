//
//  Job+CoreDataProperties.swift
//  ResumeBuilder
//
//  Created by Matthew Mauro on 2019-12-10.
//  Copyright © 2019 Matthew Mauro. All rights reserved.
//
//

import Foundation
import CoreData


extension Job {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Job> {
        return NSFetchRequest<Job>(entityName: "Job")
    }

    @NSManaged public var companyName: String?
    @NSManaged public var positionTitle: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var responsibilities: String?
    @NSManaged public var awards: String?
    @NSManaged public var companyIcon: NSObject?
    @NSManaged public var employees: NSSet?

}

// MARK: Generated accessors for employees
extension Job {

    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: Applicant)

    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: Applicant)

    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)

    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)

}
