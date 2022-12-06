input = io.input('input')
contains = 0
containd = 0

function assigntab(line)
  return assignments
end

for line in io.lines() do
  local assignments = {}
  for a in string.gmatch(line, "%d+") do
    assignments[#assignments + 1] = math.tointeger(a)
  end
  if assignments[1] >= assignments[3] and assignments[2] <= assignments[4] then
    contains = contains + 1
  elseif assignments[3] >= assignments[1] and assignments[4] <= assignments[2] then
    contains = contains + 1
  end
  if assignments[2] >= assignments[3] and assignments[2] <= assignments[4] then
    containd = containd + 1
  elseif assignments[4] >= assignments[1] and assignments[4] <= assignments[2] then
    containd = containd + 1
  end
end
print(contains)
print(containd)
