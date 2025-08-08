Description (Français)
📦 Téléportation Automatique

Ce script permet de téléporter automatiquement un joueur lorsqu’il entre dans une zone définie via des coordonnées vector3 et un rayon configurable.

✅ Fonctionnalités :

Téléportation instantanée dès que le joueur entre dans la zone.

Détection basée sur la distance 2D (X/Y) avec une tolérance verticale (Z) personnalisable (10m par défaut).

Configuration simple dans config.lua (zones, destination, rayon, etc.).

Affichage debug visuel en 3D si Config.Debug = true (utile pour voir les zones sur la carte).

Téléportation sécurisée avec fade, freeze, et chargement du sol.

100% compatible avec ESX (version exportée) et ox_lib.

🔧 Facilement modifiable pour ajouter des conditions (job, item requis, cooldown, etc.).

📁 Exemple de structure :
resources/
└── myteleport/
    ├── client.lua
    ├── server.lua
    ├── config.lua
    └── fxmanifest.lua
    

Description (English)
📦 Teleport On Zone Entry

This script allows you to automatically teleport a player when they enter a defined zone using a vector3 position and a configurable radius.

✅ Features:

Instant teleportation as soon as the player enters the zone.

Detection uses 2D distance (X/Y) with a customizable height (Z) tolerance (10m by default).

Simple configuration via config.lua (zones, destination, radius, etc.).

Debug mode available with Config.Debug = true to visualize the teleport zones in 3D.

Safe teleportation with screen fade, ground loading and entity freeze.

Fully compatible with ESX (export version) and ox_lib.

🔧 Easily extendable for job checks, item requirements, cooldowns, and more.

📁 Example structure:
resources/
└── myteleport/
    ├── client.lua
    ├── server.lua
    ├── config.lua
    └── fxmanifest.lua
