Config = {}

Config.NPCs = {
    {
        coords = vec4(929.5751, -3199.8704, 5.9005, 224.1782), -- for example, a 24/7 shop
        model = "mp_m_shopkeep_01",
        text = "[E] Shop"
    },
    {
        coords = vec4(932.8839, -3201.7271, 5.9007, 39.0705),
        model = "a_m_m_business_01",
        -- no 3dtext
    }
}

-- 3DText display formatting (global for all NPCs)
Config.TextSettings = {
    font = 4, -- more classic, bolder font style
    scale = 1.35, -- slightly smaller size
    color = { r = 255, g = 255, b = 255, a = 215 }, -- white, clearly visible
    drawBox = true, -- box true/false
    boxColor = { r = 0, g = 0, b = 0, a = 100 }, -- dark gray-black background, almost transparent
    boxPadding = 0.015, -- a bit more space around the text
    boxScaleX = 2.1, -- ⬅ width multiplier
    boxScaleY = 3.0  -- ⬅ height multiplier
}
