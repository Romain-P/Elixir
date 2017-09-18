map = %{} #define a map

#add
map = Map.put(map, :key, :value)

#get
map.key |> IO.puts
map[:key] |> IO.puts
Map.get(map, :key) |> IO.puts

#get key & value both
Map.fetch(map, :key) |> IO.inspect

#merge
Map.merge(map, %{})

#utils
x = "keyvar"
map = %{x => 1, "keystring" => "hello", 2=> :value, :atomkey => 10, atomkey_shorthand: 3}

map["keyvar"] |> IO.puts #1
map[x] |> IO.puts       #1
