Config = {}

-- Turn on/off debug prints
Config.Debug = false

Config.GatheringLocations = {
    {
        type       = "box",
        length     = 1.5,
        width      = 1.5,
        height     = 2.0,
        coords = vector3(363.79, 6482.84, 29.24),
        item = "tomato",
        label = "Gather Tomatoes",
        loading = "Gathering Tomatoes...",
        icon = "fas fa-apple-alt",
        time = 5000,
        minAmount = 1,
        maxAmount = 5,
        anim       = { type = "scenario", name = "WORLD_HUMAN_GARDENER_PLANT" }
    },
    {
        type       = "circle",
        radius     = 2.0,
        coords = vector3(378.01, 6505.42, 27.94),
        item = "apple",
        label = "Gather Apples",
        loading = "Gathering Apples...",
        icon = "fas fa-apple-whole",
        time = 6000,
        minAmount = 1,
        maxAmount = 5,
         anim       = { type = "dict", dict = "amb@world_human_hammering@male@base", clip = "base", flag = 1 }
    },
        {
        type       = "box",
        length     = 1.7,
        width      = 21.5,
        coords = vector3(501.11, 6508.72, 29.25),
        item       = "potato",
        label      = "Gather Potatoes",
        loading    = "Gathering Potatoes...",
        icon       = "fas fa-seedling",
        time       = 7000,
        minAmount  = 3,
        maxAmount  = 5,
        anim       = { type = "scenario", name = "WORLD_HUMAN_GARDENER_PLANT" }
    },
            {
        type       = "box",
        length     = 1.7,
        width      = 21.5,
        coords = vector3(509.56, 6508.32, 28.85),
        item       = "onion",
        label      = "Gather Onions",
        loading    = "Gathering Onions...",
        icon       = "fas fa-seedling",
        time       = 7000,
        minAmount  = 2,
        maxAmount  = 5,
        anim       = { type = "scenario", name = "WORLD_HUMAN_GARDENER_PLANT" }
    },
        {
        type       = "box",
        length     = 1.7,
        width      = 21.5,
        coords = vector3(494.71, 6508.55, 29.75),
        item       = "lettuce",
        label      = "Gather Lettuce",
        loading    = "Gathering Lettuce...",
        icon       = "fas fa-leaf",
        time       = 7000,
        minAmount  = 2,
        maxAmount  = 5,
        anim       = { type = "scenario", name = "WORLD_HUMAN_GARDENER_PLANT" }
    },
        {
        type       = "box",
        length     = 1.7,
        width      = 1.7,
        coords = vector3(-100.04, 6210.82, 31.03),
        item       = "chicken_strips_raw",
        label      = "Get some Raw Chicken",
        loading    = "Getting Raw Chicken...",
        icon       = "fas fa-drumstick-bite",
        time       = 7000,
        minAmount  = 2,
        maxAmount  = 5,
        anim       = { type = "scenario", name = "WORLD_HUMAN_BUM_STANDING" }
    },
        {
        type       = "circle",
        radius     = 3.5,
        coords = vector3(2359.85, 4929.24, 43.13),
        item       = "milk",
        label      = "Syphon Milk",
        loading    = "Syphoning Milk...",
        icon       = "fas fa-cow",
        time       = 7000,
        minAmount  = 2,
        maxAmount  = 5,
        anim       = { type = "scenario", name = "WORLD_HUMAN_BUM_STANDING" }
    },

}
