t={}
print(getmetatable(t))
t1={}
setmetatable(t,t1)
--assert(getmetatable(t)==t1)
print(getmetatable(t))
print(getmetatable("4"))
print(getmetatable("b"))

Set={}
function Set.new(l)
	local set = {}
	for _,k in pairs(l) do
		set[k] =true
	end
	return set
end

function Set.union(a,b)
	local res = Set.new{}
	for k,v in pairs(a) do
		res[k]=true
	end
	for k,v in pairs(b) do
		res[k]=true
	end
	return res
end

function Set.intersection(a,b )
	local res = Set.new{}
	for k in pairs(a) do
		res[k]=b[k]
	end
	return res
end

function Set.tostring(set)
	local l = {}
	for k,v in pairs(set) do
		l[#l+1]=k
		--print(k) print(v)
	end
	return "{" ..table.concat(l, ", ") .."}"
end
function Set.print(s)
	print(Set.tostring(s))
end



local mt={}
function Set.new(l)
	local set ={}
	setmetatable(set,mt)
	for _,v in ipairs(l) do set[v] =true end
	return set
end

s1=Set.new{10,20,30,40}
s2 =Set.new{30,1}
print(getmetatable(s1))
print(getmetatable(s2))

mt.__add=Set.union
s3 =s1+s2
Set.print(s3)
mt.__mul =Set.intersection
Set.print((s1+s2)*s1)

