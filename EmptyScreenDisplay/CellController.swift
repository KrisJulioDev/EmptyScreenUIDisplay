//
//  CellController.swift
//  EmptyScreenDisplay
//
//  Created by Khristoffer Julio on 1/13/24.
//

import Foundation
import UIKit
 
class SelectionCell: UITableViewCell {
    var title: String? {
        didSet {
            textLabel?.text = title
        }
    }
}

class CellController: SelectionCell {
    let item: ViewItem
    
    static func create(_ item: ViewItem) -> CellController {
        CellController(item: item)
    }
    
    init(item: ViewItem) {
        self.item = item
        super.init(style: .default, reuseIdentifier: String(describing: Self.self))
        
        var contentConfig = UIListContentConfiguration.cell()
        contentConfig.text = item.title
        contentConfig.image = item.image
        self.contentConfiguration = contentConfig
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
