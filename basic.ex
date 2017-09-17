IO.puts("Hello Word")

#atoms & var

  :lists #atom
  sort_array = :lists.sort([1,3,5,2])
  integer = 10 ; second = 12

  #print array
  IO.inspect(sort_array)

  #is this an atom?
  is_atom :atomk       #true
  is_atom :'atom'      #true
  is_atom Atomx        #true
  is_atom :"atom powa" #true
  is_atom :""          #true

#numbers

  octal = 0o52
  hexa = 0xF1
  bin = 0b1101
  IO.inspect([octal, hexa, bin])

  #binaries

  <<65, 68, 75>>
  <<65, 255, 289::size(15)>> #increase size limit

#booleans

  a = true
  a = :true
  b = false

#strings

  string = "hellow"
  multiline = """
                  hello
                  mothafucker
              """
  IO.puts(multiline)

#lists & tuples

  #list
  # stored as linked list, insertion/deletions are fast
  basic = [1, "string", :atomxd, true]

  #tuple
  # stored in contiguous memory block, which make accessing them faster but cost on insetions/deletions
  tuple = {10, "tuplestring", :tuplxd, false}

  #concanate

  concat = basic ++ [:hellow, :world]


  IO.inspect(basic); IO.inspect(tuple)

#range
values = 2..12

#perform actions on ranges
IO.puts(Enum.member?(values, 2)) #true
IO.puts(Enum.count(values)) #11