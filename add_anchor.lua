-- Define the Lua filter function
function HeaderWithAnchor(elem)
  if elem.t == "Header" then
    local level = elem.level
    if level == 2 or level == 3 then
      local anchor_name = elem.attr.identifier
      local anchor_tag = pandoc.Link(elem.content, "#" .. anchor_name)
      local header_text = elem.content
      if level == 2 then  
        return pandoc.Div({pandoc.RawBlock("html", "<h2 id='".. anchor_name .. "'><a href='#" .. anchor_name .. "'>"), header_text, pandoc.RawBlock("html", "</a></h2>")})
      else
        return pandoc.Div({pandoc.RawBlock("html", "<h3 id='".. anchor_name .. "'><a href='#" .. anchor_name .. "'>"), header_text, pandoc.RawBlock("html", "</a></h3>")})
      end
    end
  end
end

-- Add the filter to pandoc
return {
  {Header = HeaderWithAnchor}
}
