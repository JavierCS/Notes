# UIKit

### Modern Cell Configuration

A configuration describes the appearance of a view for a specific state: things like the content, styling, metrics and behavior.

Configurations are lightweight and very inexpensive to create, thery are value types in swift

```swift
// Before
let cell: UITableViewCell = ...
cell.imageView?.image = UIImage(systemName: "star")
cell.textLabel?.text = "Hello WWDC"

// Now
let cell: UITableViewCell = ...
var content = cell.defaultContentConfiguration()
content.image = UIImage(systemName: "star")
content.text = "Hello WWDC"
cell.contentConfiguration = content
```

#### Configurations Types

##### Background Configuration

Background configurations have a number of properties

* Background color
* Visual effect
* Stroke
* Insets and corner radius
* Custom view

```swift
// Example: requesting a sidebar style list cell background configuration
var background = UIBackgroundConfiguration.listSidebarCell()
```

##### List Content Configuration

List content configurations give you the standard layouts for cells, headers and footers.
* Image
* Text
* Secondary text
* Layout metrics and behaviors

```swift
// Example: requesting a sidebar style list cell content configuration
var content = UIListContentConfiguration.sidebarCell()
```

#### Configuration state

Configuration state represents the various inputs that you use to configure your cells and views.

```swift
override func updateConfiguration(using state: UICellConfigurationState) {
    var content = self.defaultContentConfiguration().updated(for: state)

    content.image = self.item.icon
    content.text = self.item.title

    if state.isHightlighted || state.isSelected {
        content.imageProperties.tintColor = .white
        content.textProperties.color = .white
    }

    self.contentConfiguration = content
}
```

### Color Transformer
