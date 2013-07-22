--
-- This is file `microtype.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- microtype.dtx  (with options: `luafile')
-- 
-- ------------------------------------------------------------------------
-- 
--                       The `microtype' package
--         Subliminal refinements towards typographical perfection
--           Copyright (c) 2004--2013 R Schlicht <w.m.l@gmx.net>
-- 
-- This work may be distributed and/or modified under the conditions of the
-- LaTeX Project Public License, either version 1.3c of this license or (at
-- your option) any later version. The latest version of this license is in:
-- http://www.latex-project.org/lppl.txt, and version 1.3c or later is part
-- of all distributions of LaTeX version 2005/12/01 or later.
-- 
-- This work has the LPPL maintenance status `author-maintained'.
-- 
-- This work consists of the files microtype.dtx and microtype.ins and the
-- derived files microtype.sty, microtype-pdftex.def, microtype-xetex.def,
-- microtype-luatex.def, microtype.lua and letterspace.sty.
-- 
-- ------------------------------------------------------------------------
--   This file contains auxiliary lua functions.
--   It was contributed by Elie Roux <elie.roux{at}telecom-bretagne.eu>.
-- ------------------------------------------------------------------------ 
--
microtype = microtype or {}
local microtype = microtype

local microtype_module = {
  name         = "microtype",
  version      = 2.5,
  date         = "2013/05/15",
  description  = "microtype module.",
  author       = "E. Roux, R. Schlicht and P. Gesang",
  copyright    = "E. Roux, R. Schlicht and P. Gesang",
  license      = "LPPL",
}

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module(microtype_module)
end

local find = string.find
local tex_write = tex.write

local function if_int(s)
  if find(s,"^-*[0-9]+ *$") then
    tex_write("@firstoftwo")
  else
    tex_write("@secondoftwo")
  end
end
microtype.if_int = if_int

local function if_dimen(s)
  if (find(s, "^-*[0-9]+(%a*) *$") or
      find(s, "^-*[0-9]*[.,][0-9]+(%a*) *$")) then
    tex_write("@firstoftwo")
  else
    tex_write("@secondoftwo")
  end
end
microtype.if_dimen = if_dimen

local function if_str_eq(s1, s2)
  if s1 == s2 then
    tex_write("@firstoftwo")
  else
    tex_write("@secondoftwo")
  end
end
microtype.if_str_eq = if_str_eq

if luaotfload and luaotfload.aux and luaotfload.aux.slot_of_name then
  local slot_of_name = luaotfload.aux.slot_of_name
  microtype.name_to_slot = function(name, unsafe)
    return slot_of_name(font.current(), name, unsafe)
  end
else
  -- we dig into internal structure (should be avoided)
  local function name_to_slot(name, unsafe)
    if fonts then
      local unicodes
      if fonts.ids then       --- legacy luaotfload
        local tfmdata = fonts.ids[font.current()]
        if not tfmdata then return end
        unicodes = tfmdata.shared.otfdata.luatex.unicodes
      else --- new location
        local tfmdata = fonts.hashes.identifiers[font.current()]
        if not tfmdata then return end
        unicodes = tfmdata.resources.unicodes
      end
      local unicode = unicodes[name]
      if unicode then --- does the 'or' branch actually exist?
        return type(unicode) == "number" and unicode or unicode[1]
      end
    end
  end
  microtype.name_to_slot = name_to_slot
end

-- 
--
-- End of file `microtype.lua'.
