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
end

-- Stolen from http://lua-users.org/wiki/TableUtils
local function combinations(t,n)
  local n,max,tn,output=n,#t,{},{}
  for x=1,n do tn[x],output[x]=x,t[x] end -- Generate 1st combo
  tn[n]=tn[n]-1 -- Needed to output 1st combo
  return function() -- Iterator fn
    local t,tn,output,x,n,max=t,tn,output,n,n,max
    while tn[x]==max+x-n do x=x-1 end -- Locate update point
    if x==0 then return nil end -- Return if no update point
    tn[x]=tn[x]+1 -- Add 1 to update point (UP)
    output[x]=t[tn[x]] -- Update output at UP
    for i=x+1,n do 
      tn[i]=tn[i-1]+1 -- Update points to right of UP
      output[i]=t[tn[i]] -- Update output to refect change in points
    end
    return output
  end
end

Alchemist.Batteries = {
    table_keys_to_list = table_keys_to_list,
    num_items_in_table = num_items_in_table,
    combinations = combinations,
    element_is_in_table = element_is_in_table,
}