//
//  FavoriteViewModel.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 29/03/23.
//

import Combine
import CoreData

class FavoriteViewModel: ObservableObject {
    
    private let viewContext = PersistenceController.shared.viewContext

    @Published var gamesArray = [Games]()
    @Published var games = [Game]()
    @Published var isExist = false
    @Published var loading = false
    @Published var empty = false
    
    init() {
        fetchGameData()
    }
    
    func fetchGameData() {
        let request = NSFetchRequest<Games>(entityName: "Games")
        do {
            self.empty = false
            self.loading = true
            let results = try viewContext.fetch(request)
            games.removeAll()
            if results.isEmpty {
                self.empty = true
            } else {
                for result in results {
                    let game = Game(
                        id: result.value(forKeyPath: "id") as? Int ?? 0,
                        name: result.value(forKeyPath: "name") as? String ?? "",
                        released: result.value(forKeyPath: "released") as? String ?? "",
                        backgroundImage: result.value(forKeyPath: "backgroundImage") as? String ?? "",
                        rating: result.value(forKeyPath: "rating") as? Float ?? 0,
                        playtime: result.value(forKeyPath: "playtime") as? Int ?? 0,
                        metacritic: result.value(forKeyPath: "metacritic") as? Int ?? 0)
                    games.append(game)
                }
            }

            self.loading = false
        } catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func getGameDataById(_ id: Int) {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Games")
                    fetchRequest.fetchLimit = 1
                    fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            do {
                if (try self.viewContext.fetch(fetchRequest).first) != nil {
                    isExist = true
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        
    }
    
    func deleteGameById(_ id: Int) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Games")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id == \(id)")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeCount
        if let batchDeleteResult = try? viewContext.execute(batchDeleteRequest) as? NSBatchDeleteResult {
                    if batchDeleteResult.result != nil {
                        isExist = false
                    }
        }
    }
    
    func addDataToCoreData(game: GameDetail) {
        let data = Games(context: viewContext)
        data.id = Int64(Int((game.id)))
        data.released = game.released
        data.rating = game.rating
        data.playtime = Int64(Int((game.playtime)))
        data.backgroundImage = game.backgroundImage
        data.name = game.name
        data.metacritic = Int64(Int((game.metacritic)))
        
        save()
        self.fetchGameData()
    }
    func save() {
        do {
            try viewContext.save()
            isExist = true
        } catch {
            print("Error saving")
        }
    }
    
}
