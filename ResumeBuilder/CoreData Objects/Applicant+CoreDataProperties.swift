//
//  Applicant+CoreDataProperties.swift
//  ResumeBuilder
//
//  Created by Matthew Mauro on 2019-12-10.
//  Copyright © 2019 Matthew Mauro. All rights reserved.
//
//

import Foundation
import CoreData


extension Applicant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Applicant> {
        return NSFetchRequest<Applicant>(entityName: "Applicant")
    }

    @NSManaged public var name: String?
    @NSManaged public var profileString: String?
    @NSManaged public var phoneNumber: Int16
    @NSManaged public var emailAddress: String?
    @NSManaged public var desiredPosition: String?
    @NSManaged public var skills: String?
    @NSManaged public var experience: NSOrderedSet?
    @NSManaged public var references: NSOrderedSet?

}

// MARK: Generated accessors for experience
extension Applicant {

    @objc(insertObject:inExperienceAtIndex:)
    @NSManaged public func insertIntoExperience(_ value: Job, at idx: Int)

    @objc(removeObjectFromExperienceAtIndex:)
    @NSManaged public func removeFromExperience(at idx: Int)

    @objc(insertExperience:atIndexes:)
    @NSManaged public func insertIntoExperience(_ values: [Job], at indexes: NSIndexSet)

    @objc(removeExperienceAtIndexes:)
    @NSManaged public func removeFromExperience(at indexes: NSIndexSet)

    @objc(replaceObjectInExperienceAtIndex:withObject:)
    @NSManaged public func replaceExperience(at idx: Int, with value: Job)

    @objc(replaceExperienceAtIndexes:withExperience:)
    @NSManaged public func replaceExperience(at indexes: NSIndexSet, with values: [Job])

    @objc(addExperienceObject:)
    @NSManaged public func addToExperience(_ value: Job)

    @objc(removeExperienceObject:)
    @NSManaged public func removeFromExperience(_ value: Job)

    @objc(addExperience:)
    @NSManaged public func addToExperience(_ values: NSOrderedSet)

    @objc(removeExperience:)
    @NSManaged public func removeFromExperience(_ values: NSOrderedSet)

}

// MARK: Generated accessors for references
extension Applicant {

    @objc(insertObject:inReferencesAtIndex:)
    @NSManaged public func insertIntoReferences(_ value: Reference, at idx: Int)

    @objc(removeObjectFromReferencesAtIndex:)
    @NSManaged public func removeFromReferences(at idx: Int)

    @objc(insertReferences:atIndexes:)
    @NSManaged public func insertIntoReferences(_ values: [Reference], at indexes: NSIndexSet)

    @objc(removeReferencesAtIndexes:)
    @NSManaged public func removeFromReferences(at indexes: NSIndexSet)

    @objc(replaceObjectInReferencesAtIndex:withObject:)
    @NSManaged public func replaceReferences(at idx: Int, with value: Reference)

    @objc(replaceReferencesAtIndexes:withReferences:)
    @NSManaged public func replaceReferences(at indexes: NSIndexSet, with values: [Reference])

    @objc(addReferencesObject:)
    @NSManaged public func addToReferences(_ value: Reference)

    @objc(removeReferencesObject:)
    @NSManaged public func removeFromReferences(_ value: Reference)

    @objc(addReferences:)
    @NSManaged public func addToReferences(_ values: NSOrderedSet)

    @objc(removeReferences:)
    @NSManaged public func removeFromReferences(_ values: NSOrderedSet)

}
