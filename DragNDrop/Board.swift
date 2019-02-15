//
//  Board.swift
//  DragNDrop
//
//  Created by Feras Allaou on 2/15/19.
//  Copyright © 2019 Feras Allaou. All rights reserved.
//

import Foundation

class Board: Codable {
    var title: String
    var items: [String]

    init(title: String, items: [String]){
        self.title = title
        self.items = items
    }
    
}
