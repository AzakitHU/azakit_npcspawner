Config = {}

Config.NPCs = {
    {
        coords = vec4(929.5751, -3199.8704, 5.9005, 224.1782), -- például 24/7 bolt
        model = "mp_m_shopkeep_01",
        text = "[E] Shop"
    },
    {
        coords = vec4(932.8839, -3201.7271, 5.9007, 39.0705),
        model = "a_m_m_business_01",
        -- nincs 3dtext
    }
}

-- 3DText megjelenítés formázása (globális minden NPC-re)
Config.TextSettings = {
    font = 4, -- klasszikusabb, keményebb betűstílus
    scale = 1.35, -- kissé visszafogottabb méret
    color = { r = 255, g = 255, b = 255, a = 215 }, -- fehér, jól látható
    drawBox = true, -- box true/false
    boxColor = { r = 0, g = 0, b = 0, a = 100 }, -- sötét szürke-fekete háttér, majdnem átlátszatlan
    boxPadding = 0.015, -- kicsit több tér a szöveg körül
    boxScaleX = 2.1, -- ⬅ szélességi szorzó
    boxScaleY = 3.0  -- ⬅ magassági szorzó
}
