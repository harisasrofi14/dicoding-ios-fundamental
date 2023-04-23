//
//  Games+CoreDataProperties.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 29/03/23.
//
//

import Foundation
import CoreData

extension Games {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Games> {
        return NSFetchRequest<Games>(entityName: "Games")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var released: String?
    @NSManaged public var backgroundImage: String?
    @NSManaged public var rating: Float
    @NSManaged public var playtime: Int64
    @NSManaged public var metacritic: Int64

}

extension Games: Identifiable { }
