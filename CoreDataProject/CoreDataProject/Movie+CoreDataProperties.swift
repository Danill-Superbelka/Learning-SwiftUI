//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Даниил  on 11.08.2021.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var yaer: Int16
    
    public var wrappedTitle: String {
        return title ?? "Unknown title"
    }

}

extension Movie : Identifiable {

}
