//
//  Database.swift
//  DragNDrop
//
//  Created by Feras Allaou on 2/19/19.
//  Copyright © 2019 Feras Allaou. All rights reserved.
//

import Foundation
import RealmSwift

class Database {
    var db: Realm!
    
    init(){
        db = try! Realm()
    }
    
    func addBoard(boardTitle : String, completion: (String?) -> Void) {
        let newBoard = Board()
        newBoard.boardTitle = boardTitle
        do {
            try db.write {
                db.add(newBoard)
                completion(nil)
            }
        }catch {
            completion("An Error occureded! ")
        }
    }
    
    func add(_ boardItem:String, to board: String, completion: (String?) -> Void) {
        let predicate = NSPredicate(format: "boardTitle = %@", board)
        let findBoard = db.objects(Board.self).filter(predicate).first

        let newItem = BoardItems(value: ["singleItem": boardItem])
        
        do {
            try findBoard?.realm?.write {
                findBoard?.items.append(newItem)
                completion(nil)
            }
        }catch {
            completion("An Error occureded! ")
        }

    }
    
    func getSingle(_ board: String) -> Board? {
        let predicate = NSPredicate(format: "boardTitle = %@", board)
        let findBoard = db.objects(Board.self).filter(predicate).first
        
        return findBoard
    }
    
    func getBoards() -> [Board] {
        let allBoards = db.objects(Board.self)
        var boardsArray = [Board]()
        if allBoards.count > 0 {
            for board in allBoards {
                boardsArray.append(board)
            }
        }
        return allBoards.count > 0 ?  boardsArray   : []
    }
    

    
}
