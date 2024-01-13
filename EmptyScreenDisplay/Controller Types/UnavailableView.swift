//
//  UnavailableView.swift
//  EmptyScreenDisplay
//
//  Created by Khristoffer Julio on 1/13/24.
//

import UIKit
 
protocol UnvailableDisplay {
    func setDisplay()
}

class UnavailableView: UIViewController, UnvailableDisplay {
    let item: ViewItem
    
    init(item: ViewItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDisplay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDisplay() {
        var config = UIContentUnavailableConfiguration.empty()
        config.textProperties.color = UIColor.label
        config.text = item.title
        config.image = item.image
        
        if let sub = item.subtitle {
            config.secondaryText = sub
        }
        
        let emptyView = UIContentUnavailableView(configuration: config)
        self.view = emptyView
    }
}
