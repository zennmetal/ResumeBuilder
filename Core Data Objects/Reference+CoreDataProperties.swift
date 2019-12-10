//
//  Reference+CoreDataProperties.swift
//  ResumeBuilder
//
//  Created by Matthew Mauro on 2019-12-10.
//  Copyright © 2019 Matthew Mauro. All rights reserved.
//
//

import Foundation
import CoreData


extension Reference {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reference> {
        return NSFetchRequest<Reference>(entityName: "Reference")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var emailAddress: String?
    @NSManaged public var referenceFor: NSSet?

}

// MARK: Generated accessors for referenceFor
extension Reference {

    @objc(addReferenceForObject:)
    @NSManaged public func addToReferenceFor(_ value: Applicant)

    @objc(removeReferenceForObject:)
    @NSManaged public func removeFromReferenceFor(_ value: Applicant)

    @objc(addReferenceFor:)
    @NSManaged public func addToReferenceFor(_ values: NSSet)

    @objc(removeReferenceFor:)
    @NSManaged public func removeFromReferenceFor(_ values: NSSet)

}
