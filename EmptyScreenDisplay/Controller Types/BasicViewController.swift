//
//  BasicViewController.swift
//  EmptyScreenDisplay
//
//  Created by Khristoffer Julio on 1/12/24.
//

import UIKit

class BasicViewController: UnavailableView {
    override func setDisplay() {
        var config = UIContentUnavailableConfiguration.empty()
        config.text = item.title
        config.secondaryText = item.subtitle
        config.image = item.image
        
        let emptyView = UIContentUnavailableView(configuration: config)
        self.view = emptyView
    }
} 
