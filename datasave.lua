--[[
local count = 0
function Entry(...) count =count+1 end

dofile("D:\\LuaStudy\\LuaStudy\\data.lua")
print("number of entrys: " .. count)
--]]
local authors={}
function Entry( b)
	authors[b[1]] =true 
end
dofile("D:\\LuaStudy\\LuaStudy\\data.lua")
for name in pairs(authors) do
	print(name)
end

a= 'a "problematic" \\string'
print(string.format("%q",a))

function serialize(o)
	if type(o) =="number" then
		io.write(o)
	elseif type(o)=="string" then
			io.write(string.format("%q",o))
	end
end
b=7
serialize(b)
