//
//  BoardCollectionViewController.swift
//  DragNDrop
//
//  Created by Feras Allaou on 2/15/19.
//  Copyright © 2019 Feras Allaou. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices
import RealmSwift

class BoardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var db: Database!
    var boardsArray: [Board] = [Board]() {
        didSet {
            if boardsArray.count > 0 {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        updateCollectionViewItem(with: view.bounds.size)
        db = Database()
        boardsArray = db.getBoards()
        
    }
    
    private func setupNavigationBar() {
        setupAddButtonItem()
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateCollectionViewItem(with: size)
    }
    
    private func updateCollectionViewItem(with size: CGSize) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        layout.itemSize = CGSize(width: 225, height: size.height * 0.6)
    }
    
    func setupAddButtonItem() {
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addListTapped(_:)))
        navigationItem.rightBarButtonItem = addButtonItem
    }
    
    func setupRemoveBarButtonItem() {
        let button = UIButton(type: .system)
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.red, for: .normal)
//        button.addInteraction(UIDropInteraction(delegate: self))
        let removeBarButtonItem = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = removeBarButtonItem
    }
    
    @objc func addListTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add List", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            guard let text = alertController.textFields?.first?.text, !text.isEmpty else {
                return
            }
            
            
            self.db.addBoard(boardTitle: text) {
                dbError in
                guard dbError == nil else {
                    print("Error saving to DB")
                    return
                }
                
                self.boardsArray = self.db.getBoards()
            }
        
        
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boardsArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BoardCollectionViewCell
        cell.setup(with: boardsArray[indexPath.row])
        cell.parentVC = self
        return cell
    }
    
}

//extension BoardCollectionViewController: UIDropInteractionDelegate {
//
//    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
//        return UIDropProposal(operation: .move)
//    }
//
//    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
//
//        if session.hasItemsConforming(toTypeIdentifiers: [kUTTypePlainText as String]) {
//            session.loadObjects(ofClass: NSString.self) { (items) in
//                guard let _ = items.first as? String else {
//                    return
//                }
//
//                if let (dataSource, sourceIndexPath, tableView) = session.localDragSession?.localContext as? (Board, IndexPath, UITableView) {
//                    tableView.beginUpdates()
//                    dataSource.items.remove(at: sourceIndexPath.row)
//                    tableView.deleteRows(at: [sourceIndexPath], with: .automatic)
//                    tableView.endUpdates()
//                }
//            }
//        }
//    }
//
//}
