
[1mFrom:[0m /home/jmckenzie1004-74361/code/labs/rack-dynamic-routes-lab-v-000/app/application.rb @ line 34 Application#call:

    [1;34m11[0m:   [32mdef[0m [1;34mcall[0m(env)
    [1;34m12[0m:     resp = [1;34;4mRack[0m::[1;34;4mResponse[0m.new
    [1;34m13[0m:     req = [1;34;4mRack[0m::[1;34;4mRequest[0m.new(env)
    [1;34m14[0m: 
    [1;34m15[0m:     [32mif[0m req.path.match([35m[1;35m/[0m[35mitems[1;35m/[0m[35m[0m)
    [1;34m16[0m:       req_item = req.path.split([31m[1;31m"[0m[31m/items/[1;31m"[0m[31m[0m).last
    [1;34m17[0m:       [1;34m# binding.pry[0m
    [1;34m18[0m:       found_item = [1;36mself[0m.class.items.find [32mdo[0m |item|
    [1;34m19[0m:         item.name == req_item
    [1;34m20[0m:       [32mend[0m
    [1;34m21[0m: [1;34m# binding.pry[0m
    [1;34m22[0m:       [32mif[0m found_item
    [1;34m23[0m:         resp.write found_item.price
    [1;34m24[0m:         resp.status = [1;34m200[0m
    [1;34m25[0m:         [1;34m# binding.pry[0m
    [1;34m26[0m:       [32melse[0m
    [1;34m27[0m:         resp.write [31m[1;31m"[0m[31mItem not found[1;31m"[0m[31m[0m
    [1;34m28[0m:         resp.status = [1;34m400[0m
    [1;34m29[0m: 
    [1;34m30[0m:       [32mend[0m
    [1;34m31[0m:     [32melse[0m
    [1;34m32[0m:       resp.write [31m[1;31m"[0m[31mRoute not found[1;31m"[0m[31m[0m
    [1;34m33[0m:       resp.status = [1;34m404[0m
 => [1;34m34[0m:       binding.pry
    [1;34m35[0m:     [32mend[0m
    [1;34m36[0m:   [32mend[0m

