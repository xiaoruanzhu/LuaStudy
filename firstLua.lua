------协同程序实现迭代器
--递归实现元素所有组合
--[[
function permgen(a,n)
	n=n or #a
	if n<=1 then
		printResult(a)
	else
		for i=1,n do
			-- 将第一个元素放到数组末尾
			a[n],a[i] =a[i],a[n]
			permgen(a,n-1)
			a[n],a[i] =a[i],a[n]
		end
	end
end

function printResult(a)
	for i=1,#a do
		io.write(a[i]," ")
	end
	io.write("\n")
end

permgen({1,2,3,4})

--]]

----协同迭代器
function permgen(a,n)
	n=n or #a
	if n<=1 then
		coroutine.yield(a)
	else
		for i=1,n do
			-- 将第一个元素放到数组末尾
			a[n],a[i] =a[i],a[n]
			permgen(a,n-1)
			a[n],a[i] =a[i],a[n]
		end
	end
end

function permutations(a)
	local co = coroutine.create(function() permgen(a) end)
	return function ()
		local code,res = coroutine.resume(co)
		return res
	end
end

function printResult(a)
	for i=1,#a do
		io.write(a[i]," ")
	end
	io.write("\n")
end

for p in permutations{"a","b","c"} do
	printResult(p)
end
