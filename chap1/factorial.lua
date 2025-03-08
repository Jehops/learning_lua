#!/usr/libexec/flua

-- defines a factorial function
function fact (n)
	if n < 0 then
		return nil
	elseif n == 0 then
		return 1
	else
		return n * fact(n - 1)
	end
end

io.write("enter a number: ")
a = io.read("*n") -- reads a number
f = fact(a)
if not f then
	print "Kindly fuck off with the negative number."
else
	print(fact(a))
end
