# tallgrass-public: A Public PokéWidget Example

<img src="https://johnpdavis.github.io/images/TallGrassHero.png" width="250">

Tall Grass does not satisfy The Pokémon Company's Terms of Use for usage of Pokémon intellectual property. As their policy is to decline all requests for licenses, it is not suited for the App Store and is released here as a means to serve as an educational tool for the community. 

[The Pokémon Company Terms of Use](https://www.pokemon.com/us/terms-of-use/)

The Application has two parts: the host application, and the widget extension.

# The Host Application
The host application provides instructional information for users unfamilar with Apple's homescreen widgets. It explains how to add, select, and configure widgets. 

# The Widget Extension
The widget extension provides a widget view and a timeline provider. 

#### The Timeline Provider
The timeline provider, when invoked, will retrieve a PokéAPI entry for a random pokemon. It will continue by retrieving the "official" artwork of that creature view PokéAPI's rehosted imagery. When creating the timeline for the widget, the provier will check the widget's configuration for the chosen refresh delay and incorporate that into the expiration time.

#### The Widget View
The widget view displays the retrieved pokemon image, and sets it between two grass images. The coloring of the background, the foreground grass blades, and the background grass blades is achieved via a solution by Jathu. [Reference Here](https://github.com/jathu/UIImageColors)
