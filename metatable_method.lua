Set={}
--初始化
function Set.new(l)
	local set = {}
	for k,v in pairs(l) do
		set[v] =true
	end
	return set
end
--加法
function Set.union(a,b)
	local res = Set.new{}
	for k in pairs(a) do
		res[k] =true
	end
	for k in pairs(b) do
		res[k] =true
	end
	return res
end
--求交集
function Set.intersection(a,b)
	local res = Set.new{}
	for k in pairs(a) do
		res[k]=b[k]
	end
	return res
end
--转string
function Set.tostring(set)
	local l = {} --用于存放集合中所有元素的集合
	for k in pairs(set) do
		l[#l+1] =k
	end
	return "{" ..table.concat( l, ", ") .."}"
end

function Set.print(s)
	print(Set.tostring(s))
end



local mt ={}   --存放元方法


function Set.new(l)  --第2版   
	local set = {}
	setmetatable(set,mt)
	for k,v in pairs(l) do
		set[v] =true
	end
	return set
end
--从此以后，所有由Set.new创建的集合都具有一个相同的元素
s1 =Set.new{10,20,30,50}
s2 =Set.new{30,1}
print(getmetatable(s1))
print(getmetatable(s2))

--添加元方法
mt.__add=Set.union
s3 =s1+s2
Set.print(s3)

for k,v in pairs(mt) do
	print(k,v)
end

mt.__mul =Set.intersection
Set.print((s1+s2)*s2)

s =Set.new{10,2,3}
s =s +{8}
Set.print(s)

--小于等于
mt.__le =function(a,b)
	for k in pairs(a) do
		if not b[k] then return false end
	end
	return true
end

--小于
mt.__lt=function (a,b)
	return a<=b and not (b<=a)
end

--等于
mt.__eq =function (a,b)
	return a<=b and b<=a
end

s1 =Set.new{2,4}
s2 =Set.new{4,10,2}
print(s1<=s2)
print(s1< s2)
print(s1>=s2)
print(s1==s2)
print(s1==s2*s1)

--[[  可行
mt.__tostring =function (a)
	return "my tostring"
end
--]]
mt.__tostring =Set.tostring
print(s1)


--=======================================
print("===============================")
--=======================================
Window ={}
Window.prototype={x=0,y=0,width =100,height =100}
Window.mt ={}
function Window.new(o)
	setmetatable(o,Window.mt)
	return o
end
Window.mt.__index=function (table,key)
	return Window.prototype[key]
end

w=Window.new{x=10,y=20,1500}
print(w.width)
--print(w.x)
print( rawget(w,"width")) --rawget该方法不会触发__index元方法
print( rawget(w,"x")) 
print( rawget(w,1)) 


Window.mt.__newindex =function (table,key,value)
	Window.prototype[key] =value
end

w.xx =201
print(w.xx)
print("=========")
for k,v in pairs(w) do
	print(k,v)
end

rawset(w,"xx",202)   --绕过__newindex函数
print(w.xx)


---======================
---追踪table
