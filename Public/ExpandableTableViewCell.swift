//
//  ExpandableTableViewCell.swift
//  Test
//
//  Created by luojie on 15/12/11.
//  Copyright © 2015年 LuoJie. All rights reserved.
//

import UIKit

protocol TableViewCellExpandSkill { }

extension TableViewCellExpandSkill where Self: UITableViewCell {
    func updateSize(updates: (Void -> Void)) {
        containingTableView?.beginUpdates()
        updates()
        containingTableView?.endUpdates()
    }
    
    private var containingTableView: UITableView? {
        for var superview = self.superview ; superview != nil ; superview = superview!.superview {
            if let tableView = superview as? UITableView {
                return tableView
            }
        }
        return nil
    }
}

