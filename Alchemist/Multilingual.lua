local translations = {
    english = {},
    french = {},
    german = {},
}

local current_language_cached

local function get_current_language()
    if current_language_cached == nil then
        local si_map = {
            ["yes"] = "english",
            ["ja"] = "german",
            ["oui"] = "french",
        }

        local yes = GetString(SI_YES):lower()
        assert(si_map[yes])
        current_language_cached = si_map[yes]
    end

    return current_language_cached
end

local function register_translation(language, key, value)
    assert(key ~= nil)
    assert(value ~= nil)
    assert(translations[language] ~= nil)
    assert(translations[language][key] == nil)

    translations[language][key] = value
end

local function register_translations(language, translation_table)
    for key, value in pairs(translation_table) do
        register_translation(language, key, value)
    end
end

local function translate_text(text)
    local language = get_current_language()
    return translations[language][text] or text
end

Alchemist.Multilingual = {
    translate_text = translate_text,
    register_translation = register_translation,
    register_translations = register_translations,
    get_current_language = get_current_language,
}
