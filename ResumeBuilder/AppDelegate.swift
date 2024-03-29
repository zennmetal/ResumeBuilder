//
//  AppDelegate.swift
//  ResumeBuilder
//
//  Created by Matthew Mauro on 2019-12-09.
//  Copyright © 2019 Matthew Mauro. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        var chosenApplicant:Applicant?
        
        //find an applicant to show, or create one, before initalizing the root views
        let fetchedApplicants = self.fetch(Applicant.self)
        if fetchedApplicants.count == 0 {
            //no applicant data found, createDummy Data
            chosenApplicant = self.createWayne()
            self.saveContext()
        } else {
            chosenApplicant = fetchedApplicants.first
        }
        
        //MARK: SplitView Controller Initialization
        
        //initate root view Controllers
        let sectionTableViewController = ResumeSectionTableViewController()
        let detailViewController = ResumeDetailViewController()
        
        sectionTableViewController.sectionDetailDelegate = detailViewController
        sectionTableViewController.currentApplicant = chosenApplicant
        detailViewController.currentApplicant = chosenApplicant
        
        //Embed rootVC's in Navigation controllers
        let masterNavigationView = UINavigationController(rootViewController: sectionTableViewController)
        let detailNavigationView = UINavigationController(rootViewController: detailViewController)
        
        //Embed in SplitView Controller
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [masterNavigationView, detailNavigationView]
        splitViewController.preferredPrimaryColumnWidthFraction = 1/3
        splitViewController.preferredDisplayMode = .allVisible
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
        return true
    }

    //MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ResumeBuilder")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    //MARK: Core Data Flexi-Fetch
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        let context = persistentContainer.viewContext
        
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
    
    //MARK: Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    //MARK: - Applicant Data creation
    //create an Applicant, named Wayne Gretzky. list the teams he played for, awards won, and various skills
    func createWayne() -> Applicant {
        var theGreatOne:Applicant?
        theGreatOne = Applicant(context: self.persistentContainer.viewContext)
        
        theGreatOne!.name = "Wayne Gretzky"
        theGreatOne!.phoneNumber = "416-999-9999"
        theGreatOne!.profileString =
        "Wayne Douglas Gretzky is a Canadian former professional ice hockey player and former head coach. He played 20 seasons in the National Hockey League (NHL) for four teams from 1979 to 1999. Nicknamed 'The Great One', he has been called 'the greatest hockey player ever' by many sportswriters, players, and the NHL itself. Gretzky is the leading scorer in NHL history, with more goals and assists than any other player. He garnered more assists than any other player scored total points, and is the only NHL player to total over 200 points in one season – a feat he accomplished four times. In addition, Gretzky tallied over 100 points in 16 professional seasons, 14 of them consecutive. At the time of his retirement in 1999 and persisting through 2017, he holds 61 NHL records: 40 regular season records, 15 playoff records, and 6 All-Star records"
        let edmontonOilers = Job(context: self.persistentContainer.viewContext)
        edmontonOilers.companyName = "Edmonton Oilers"
        edmontonOilers.companyIcon = UIImage(named: "oilers")
        edmontonOilers.positionTitle = "Superstar Captain & Centerman"
        edmontonOilers.startDate = self.dateFromString(10, 01, 1979)
        edmontonOilers.endDate = self.dateFromString(8, 9, 1988)
        edmontonOilers.awards = "8 Hart Memorial Trophies, 7 Art Ross Trophies, 2 Con Smythe Trophies, 5 Stanley Cup Championships, and 1 Lady Bing Trophy"
        theGreatOne?.addToExperience(edmontonOilers)
        
        let laKings = Job(context: self.persistentContainer.viewContext)
        laKings.companyName = "Los Angeles Kings"
        laKings.companyIcon = UIImage(named: "kings")
        laKings.positionTitle = "Alternate Captain & Centerman"
        laKings.startDate = self.dateFromString(8, 9, 1988)
        laKings.endDate = self.dateFromString(2, 27, 1996)
        theGreatOne?.addToExperience(laKings)
        
        let blues = Job(context: self.persistentContainer.viewContext)
        blues.companyName = "St.Louis Blues"
        blues.companyIcon = UIImage(named: "blues")
        
        theGreatOne?.addToExperience(blues)
        
        return theGreatOne!
    }
    
    //MARK: Date Formatting
    func dateFromString(_ month:Int,_ day:Int,_ year:Int) -> Date? {
        guard month < 12 && day < 31 else { return nil }
        
        var date:Date?
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        date = dateFormatter.date(from: "\(month) \(day), \(year)")
        
        return date
    }
}

