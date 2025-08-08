Config = {}
Config.Debug = false -- Affiche les zones en 3D si true
Config.Zones = {
    {
        name = "Test",
        center = vector3(200.0, -900.0, 30.0), -- Zone d'entrée
        radius = 5.0,
        destination = vector3(300.0, -1000.0, 29.0), -- TP ici
        heading = 180.0 
    },
    -- Tu peux en ajouter d'autres 
}
