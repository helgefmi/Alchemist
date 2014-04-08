-- table_keys_to_list({a = 1, b = 2}) -> {a, b}
local function table_keys_to_list(tbl)
    local ret = {}
    for key, _ in pairs(tbl) do
        table.insert(ret, key)
    end
    return ret
end

-- num_items_in_table({2, 4, 6}) -> 3
local function num_items_in_table(tbl)
    n = 0
    for _ in pairs(tbl) do
        n = n + 1
    end
    return n
end

-- element_is_in_table(2, {1, 3, 5}) -> false
local function element_is_in_table(item, tbl)
    for _, value in pairs(tbl) do
        if value == item then
            return true
        end
    end
    return false
end

-- Stolen from http://lua-users.org/wiki/TableUtils
function combinations(lst, n)
  local a, number, select, newlist
  newlist = {}
  number = #lst
  select = n
  a = {}
  for i=1,select do
    a[#a+1] = i
  end
  newthing = {}
  while(1) do
    local newrow = {}
    for i = 1,select do
      newrow[#newrow + 1] = lst[a[i]]
    end
    newlist[#newlist + 1] = newrow
    i=select
    while(a[i] == (number - select + i)) do
      i = i - 1
    end
    if(i < 1) then break end
    a[i] = a[i] + 1
    for j=i, select do
      a[j] = a[i] + j - i
    end
  end
  return newlist
end

Alchemist.Batteries = {
    table_keys_to_list = table_keys_to_list,
    num_items_in_table = num_items_in_table,
    combinations = combinations,
    element_is_in_table = element_is_in_table,
}
