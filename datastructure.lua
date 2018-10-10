--[[
a={[1]=3,[2]=5}
print(a[1])

a={}
for i=-5,5 do
	a[i]=0
end
--]]

a={}
k =0
for i=1,100 do
	k=k+1
	if	k%4==0 then
		a[i] =i
	end
end

a={first=4, 5,8}
print(a[2])
table.insert(a,2,10)
print(a[2])
print(a.first)

List={}
function List.new()
	return {first=0,last=-1}
end
a=List.new()

function List.pushfirst(list,value)
	local first = list.first -1
	list.first =first
	list[first] =value
end

function List.popfirst(list)
	local first = list.first
	if first>list.last then error("list is empth")end
	local value = list[first]
	list[first] =nil	--为了允许垃圾收集
	list.first =first+1
	return value
end

function List.poplast(list)
	local  last = list.last
	if list.first>last then error("list is empth") end
	local value = list[last]
	list[last] =nil
	list.last =last-1
	return value
end

t={"i","am","a" ,"worker"}
local s = table.concat(t,"\n")
print(s)

