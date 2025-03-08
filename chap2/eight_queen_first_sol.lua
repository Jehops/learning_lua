N = 8
s = 0

-- board size
-- check whether position (n,c) is free from attacks
function isplaceok (a,n,c)
   for i=1, n-1 do -- look at queens on the board
      if (a[i] == c) or -- same column?
         (a[i]-i == c-n) or -- same diagonal?
         (a[i]+i == c+n) then -- same diagonal?
         return false -- place can be attacked
      end
   end
   return true -- no attacks; place is OK
end

-- print a board
function printsolution (a)
   print("Solution " .. s)
   for i=1, N do -- for each row
      for j=1, N do -- for each column
         -- write "X" or "-" plus a space
         io.write(a[i] == j and "X" or "-", " ")
      end
      io.write("\n")
   end
   io.write("\n")
end

-- add to board 'a' all queens from 'n' to 'N'
function addqueen (a,n)
   if n > N then  -- all queens have been placed?
      s = s+1
      printsolution(a)
   else -- try to place nth queen
      for c = 1, N do
         if isplaceok(a,n,c) then -- can the nth queen be placed in column c?
            a[n] = c -- yes, so place it
            addqueen(a,n+1) -- place the next queen on the board
         end
      end
   end
end

--run the program
addqueen({},1)
