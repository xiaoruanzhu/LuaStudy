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
List.pushfirst(a,2)
print(a[a.first])
