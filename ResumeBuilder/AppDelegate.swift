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
        
        //MARK: SplitView Controller Initialization
        
        //initate root view Controllers
        let sectionTableViewController = ResumeSectionTableViewController()
        let detailViewController = ResumeDetailViewController()
        
        //Embed rootVC's in Navigation controllers
        let masterNavigationView = UINavigationController(rootViewController: sectionTableViewController)
        let detailNavigationView = UINavigationController(rootViewController: detailViewController)
        
        //Embed in SplitView Controller
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [masterNavigationView, detailNavigationView]
        splitViewController.preferredPrimaryColumnWidthFraction = 1/3
        
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

}

