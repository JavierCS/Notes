# Liquid Glass

![](./Resources/adoption-guide-intoducing-liquid-glass-hero.png)

[Apple Developer Documentation - Liquid Glass](https://developer.apple.com/documentation/TechnologyOverviews/liquid-glass)
[WWDC25 - Meet Liquid Glass]()
[WWDC25 - Design with the Liquid Glass desing system]()
[WWDC25 - Build a UIKit app with the new design]()

## When to use

For navigation items, 

## Tinting

Avoid tinting all your elements because when evey element is tinted, nothing stands out, and it can be confusing.

![](./Resources/wrongTintedToolBar.PNG)

If you want to imbue color into your app, do it in the content layer instead.

![](./Resources/tintedToolBar.PNG)

> :warning: **Warning:**
>
> Tinting should only be used to bring emphasis to primary elements and actions in the UI.

Avoid intersections between content and Liquid Glass

![](./Resources/wrongButtonPadding.PNG)

Instead, reposition or scale the content to mantain separation.

<div style="display: flex; justify-content: center; gap: 10px;">
  <img src="./Resources/buttonPadding.PNG" alt="Imagen 1" style="width: 50%;">
  <img src="./Resources/buttonPaddingAlternative.PNG" alt="Imagen 2" style="width: 50%;">
</div>

