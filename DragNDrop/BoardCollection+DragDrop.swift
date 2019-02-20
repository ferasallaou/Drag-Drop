//
//  BoardCollection+DragDrop.swift
//  DragNDrop
//
//  Created by Feras Allaou on 2/19/19.
//  Copyright © 2019 Feras Allaou. All rights reserved.
//

import Foundation


//extension BoardCollectionViewCell: UITableViewDragDelegate {
//
////    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
////        //guard let board = board, let stringData = board.items[indexPath.row].data(using: .utf8) else {
////            return []
////        }
//
//        let itemProvider = NSItemProvider(item: stringData as NSData, typeIdentifier: kUTTypePlainText as String)
//        let dragItem = UIDragItem(itemProvider: itemProvider)
//        session.localContext = (board, indexPath, tableView)
//
//        return [dragItem]
//    }
//}

//extension BoardCollectionViewCell: UITableViewDropDelegate {

//    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
//        if coordinator.session.hasItemsConforming(toTypeIdentifiers: [kUTTypePlainText as String]) {
////            coordinator.session.loadObjects(ofClass: NSString.self) { (items) in
////                guard let string = items.first as? String else {
////                    return
////                }
////                var updatedIndexPaths = [IndexPath]()
////
//////                switch (coordinator.items.first?.sourceIndexPath, coordinator.destinationIndexPath) {
//////                case (.some(let sourceIndexPath), .some(let destinationIndexPath)):
//////                    // Same Table View
//////                    if sourceIndexPath.row < destinationIndexPath.row {
//////                        updatedIndexPaths =  (sourceIndexPath.row...destinationIndexPath.row).map { IndexPath(row: $0, section: 0) }
//////                    } else if sourceIndexPath.row > destinationIndexPath.row {
//////                        updatedIndexPaths =  (destinationIndexPath.row...sourceIndexPath.row).map { IndexPath(row: $0, section: 0) }
//////                    }
//////                    self.tableView.beginUpdates()
//////                    self.board?.items.remove(at: sourceIndexPath.row)
//////                    //self.board?.items.insert(string, at: destinationIndexPath.row)
//////                    self.tableView.reloadRows(at: updatedIndexPaths, with: .automatic)
//////                    self.tableView.endUpdates()
//////                    break
//////
//////                case (nil, .some(let destinationIndexPath)):
//////                    // Move data from a table to another table
//////                    self.removeSourceTableData(localContext: coordinator.session.localDragSession?.localContext)
//////                    self.tableView.beginUpdates()
//////                    //self.board?.items.insert(string, at: destinationIndexPath.row)
//////                    //self.tableView.insertRows(at: [destinationIndexPath], with: .automatic)
//////                    self.tableView.endUpdates()
//////                    break
//////
//////
//////                case (nil, nil):
//////                    // Insert data from a table to another table
//////                    self.removeSourceTableData(localContext: coordinator.session.localDragSession?.localContext)
//////                    self.tableView.beginUpdates()
//////                    //self.board?.items.append(string)
//////                    self.tableView.insertRows(at: [IndexPath(row: self.board!.items.count - 1 , section: 0)], with: .automatic)
//////                    self.tableView.endUpdates()
//////                    break
//////
//////                default: break
//////
//////                }
////            }
//        }
//    }

//    func removeSourceTableData(localContext: Any?) {
//        if let (dataSource, sourceIndexPath, tableView) = localContext as? (Board, IndexPath, UITableView) {
//            tableView.beginUpdates()
//            dataSource.items.remove(at: sourceIndexPath.row)
//            tableView.deleteRows(at: [sourceIndexPath], with: .automatic)
//            tableView.endUpdates()
//        }
//    }

//    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
//        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
//    }
//}

