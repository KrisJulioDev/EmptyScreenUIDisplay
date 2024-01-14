# Native Empty screen display using new Swift API 
------------------------------------------
`iOS17+` `WWDC23` `UIKIT` `Swift` `iOS`

Implements Empty Result display using UIContentUnavailableConfiguration in Swift 


![Simulator Screenshot - iPhone 15 - 2024-01-13 at 15 22 47](https://github.com/KrisJulioDev/SwiftEmptyScreenUIDisplay/assets/8087709/4de471ec-7f93-4696-a7a5-770a2a0344d2)

Sample use
```
var config = UIContentUnavailableConfiguration.empty()
config.text = item.title
config.image = item.image
config.button = retryButtonConfiguration
config.buttonProperties.primaryAction = UIAction(title: "Reload Matches", handler: retry)
config.secondaryText = item.subtitle

config.button.titleTextAttributesTransformer = titleTextTransformer
view = UIContentUnavailableView(configuration: config)
```
 
