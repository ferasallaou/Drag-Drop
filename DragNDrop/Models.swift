//
//  Models.swift
//  DragNDrop
//
//  Created by Feras Allaou on 2/19/19.
//  Copyright © 2019 Feras Allaou. All rights reserved.
//

import Foundation
import RealmSwift

class Board: Object {
    @objc dynamic var boardTitle = ""
    var items = List<BoardItems>()
}

class BoardItems: Object {
    @objc dynamic var singleItem: String = ""
    
}
