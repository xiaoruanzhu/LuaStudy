

function fwrite( fmt,... )
	return io.write(string.format(fmt, ...))
end

function writeheader()
	io.write([[
		<html>
		<head><title>Projects using lua</title><head>
		<body bgcolor="#FFFFFF">
		网页body1<a href="home.html">Lua</a>
		<br>
		]])
end
function entry1(o)
	count =count+1
	local title = o.title or '(no title)'
	fwrite('<li><a href="#%d">%s</a>\n' , count,title)
end

function entry2(o)
	count= count+1
	fwrite('<hr>\n<h3>\n')

	local href =o.url and string.format('href="%s"', o.url) or ''
	local title =o.title or o.org or 'org'
	fwrite('<a name="%d"%s>%s</a>\n' , count,href,title)
	if o.title and o.org then
		fwrite('<br>\n<small><em>%s</em></small>',o.org)
	end
	fwrite('\n</h3>\n')

	if o.description then
		fwrite('%s<p>\n',string.gsub(o.description,'\n\n+' ,'<p>\n'))
	end

	if o.email then
		fwrite('Contact:<a href="mailto :%s">%s</a>\n', o.email,o.contact or o.email)
	elseif o.contact then
			fwrite('Contact:%s\n', o.contact)
	end
end


function writetail()
	fwrite('</body></html>\n')
end


data ={
	title ="Tecgraf",
	org="Computer Graphics Technology Group,PUC-Rio",
	url ="http://www.tecgraf.puc-rio.br/",
}


writeheader()
count = 0
entry = entry1
fwrite('<ul>\n')
entry(data)
fwrite('</ul>\n')

count = 0
entry = entry2
entry(data)

writetail()

function prefix(w1,w2)
	return w1 .." " ..w2
end

function allwords()
	local line=io.read()
	local pos = 1
	return function ()
		while line do
			local s,e = string.find(line,"%w+",pos)
			if s then
				pos =e+1
				return string.sub(line,s,e)
			else
				line =io.read()
				pos=1
			end
		end
		return nil
	end
end

local statetab={}
function insert(index,value)
	local list = statetab[index]
	if list==nil then
		statetab[index] ={value}
	else
		list[#list +1]=value
	end
end

local N=2
local MAXGET = 5
local NOWORD = "\n"

--构建table
local w1,w2 = NOWORD,NOWORD
for w in allwords() do
	insert(prefix(w1,w2),w)
	w1=w2;w2=w
end
insert(prefix(w1,w2),NOWORD)

--生成文本
w1=NOWORD;w2=NOWORD
for i=1,MAXGET do
	local list = statetab[prefix(w1,w2)]
	--从列表中选择一个随机项
	local r = math.random(#list)
	local nextword = list[r]
	if nextword ==NOWORD then return end
	io.write(nextword," ")
	w1=w2;w2=nextword
end
