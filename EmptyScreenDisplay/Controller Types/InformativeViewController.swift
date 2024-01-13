//
//  InformativeViewController.swift
//  EmptyScreenDisplay
//
//  Created by Khristoffer Julio on 1/13/24.
//

import UIKit

class InformativeViewController: UnavailableView {
    override func setDisplay() {
        var config = UIContentUnavailableConfiguration.empty()
        config.text = item.title
        config.image = item.image
        config.button = retryButtonConfiguration
        config.buttonProperties.primaryAction = UIAction(title: "Reload Matches", handler: retry)
        config.secondaryText = item.subtitle
  
        config.button.titleTextAttributesTransformer = titleTextTransformer
        view = UIContentUnavailableView(configuration: config)
    }
    
    private func retry(action: UIAction) {
        print("Retry button tapped \(action.title)")
    }
    
    private lazy var retryButtonConfiguration: UIButton.Configuration = {
        var retryButton = UIButton.Configuration.borderedProminent()
        retryButton.image = UIImage(systemName: "arrow.clockwise.icloud")
        retryButton.imagePadding = 10
        retryButton.cornerStyle = .capsule
        retryButton.title = "Reload"
        return retryButton
    }()
    
    private lazy var titleTextTransformer: UIConfigurationTextAttributesTransformer = {
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.foregroundColor = .white
            outgoing.font = UIFont.boldSystemFont(ofSize: 20)
            return outgoing
        }
        return transformer
    }()
}
