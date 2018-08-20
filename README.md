# fast-start-template-godot
Scenes and actors (with basic animation and FSM) templates. Menu>Game>Victory/GameOver. Written in Godot

## How to use it

1. Download the project as zip (from Master or from Release tab)
2. Use it as template to build your game in this path `screens/game_screen`

## Content
This template is composed by:

- addons: Folder in which are contained [FSM](https://github.com/kubecz3k/FiniteStateMachine) and [tiled-importer](https://github.com/vnen/godot-tiled-importer) plugins 
- assets: Folder where there are assets for the scenes, in particular assets for the default theme:
  - textures: contains texture for blocks and panels and labels
  - utilities: contains fonts and frames
- characters: Folder where there are the scenes of a generic character, will handle FSM and animation
- screens: Folder containing generic scenes, all inherited from basic_screen
- ui (used more as reference): [GUI](https://www.youtube.com/watch?v=YL8apqN6IJM) and [Game interface](https://www.youtube.com/watch?v=y1E_y9AIqow)
- debug: Where to put debug nodes - as for example there is a label that shows Frame per seconds


## Resources used and aknowledgement

- Fonts: [Londrina](https://www.dafont.com/it/londrina.font?l[]=10&l[]=1) and [Uroob](https://github.com/smc/Uroob)
- Frame Texture: [Freepik](https://www.freepik.com/free-photos-vectors/frame)
- Scenes structure and theme: inspired by [PigDev](https://pigdev.itch.io/)
- Character structure: inspired by [GDquest](https://www.youtube.com/channel/UCxboW7x0jZqFdvMdCFKTMsQ)