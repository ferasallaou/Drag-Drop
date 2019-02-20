//
//  BoardCollectionViewCell.swift
//  DragNDrop
//
//  Created by Feras Allaou on 2/15/19.
//  Copyright © 2019 Feras Allaou. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class BoardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    var board: Board!
    var db: Database!
    
    weak var parentVC: BoardCollectionViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        db = Database()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.dragInteractionEnabled = true
//        tableView.dropDelegate = self
//        tableView.dragDelegate = self
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10.0
        
    }
    
    func setup(with board: Board) {
        self.board = board
        tableView.reloadData()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            guard let text = alertController.textFields?.first?.text, !text.isEmpty else {
                return
            }
            
            guard let _ = self.board else {
                return
            }
            

            self.db.add(text, to: self.board.boardTitle) {
                addError in
                
                guard addError == nil else {
                    print("ERROR WHILE ADDING ITEM")
                    return
                }
                
                self.board = self.db.getSingle(self.board.boardTitle)
                self.tableView.reloadData()
                
                
            }
            
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        parentVC?.present(alertController, animated: true, completion: nil)
    }
}

extension BoardCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return board?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return board?.boardTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let singleItem = board!.items[indexPath.row]
        cell.textLabel?.text = "\(singleItem.singleItem)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
