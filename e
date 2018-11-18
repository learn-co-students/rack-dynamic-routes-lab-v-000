
[1mFrom:[0m /home/sammy-brake/rack-dynamic-routes-lab-v-000/app/application.rb @ line 9 Application#call:

     [1;34m5[0m: [32mdef[0m [1;34mcall[0m(env)
     [1;34m6[0m:   resp = [1;34;4mRack[0m::[1;34;4mResponse[0m.new
     [1;34m7[0m:   req = [1;34;4mRack[0m::[1;34;4mRequest[0m.new(env)
     [1;34m8[0m:   item = req.path.split([31m[1;31m"[0m[31m/[1;31m"[0m[31m[0m).pop
 =>  [1;34m9[0m:   binding.pry
    [1;34m10[0m:   [32mif[0m req.path.match([35m[1;35m/[0m[35mitems[1;35m/[0m[35m[0m)
    [1;34m11[0m:     [32mif[0m [36m@@items[0m.include?(item)
    [1;34m12[0m:       resp.write item.price
    [1;34m13[0m:     [32melse[0m
    [1;34m14[0m:       resp.write [31m[1;31m"[0m[31mItem not found[1;31m"[0m[31m[0m
    [1;34m15[0m:            resp.status = [1;34m400[0m
    [1;34m16[0m:     [32mend[0m
    [1;34m17[0m:     [1;34m#if the item is in @@items, print the price[0m
    [1;34m18[0m:   [1;34m#   @@items.each do |individual_item|[0m
    [1;34m19[0m:   [1;34m#     if individual_item == item[0m
    [1;34m20[0m:   [1;34m#       item.price[0m
    [1;34m21[0m:   [1;34m#     else[0m
    [1;34m22[0m:   [1;34m#       resp.write "Item not found"[0m
    [1;34m23[0m:   [1;34m#       resp.status = 400[0m
    [1;34m24[0m:   [1;34m#      end[0m
    [1;34m25[0m:   [1;34m#   end[0m
    [1;34m26[0m:   [32melse[0m
    [1;34m27[0m:     resp.write [31m[1;31m"[0m[31mRoute not found[1;31m"[0m[31m[0m
    [1;34m28[0m:     resp.status = [1;34m404[0m
    [1;34m29[0m:   [32mend[0m
    [1;34m30[0m:   resp.finish
    [1;34m31[0m: [32mend[0m

