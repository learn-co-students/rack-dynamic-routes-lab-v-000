
[1mFrom:[0m /home/aniqaelahi-19061/code/labs/rack-dynamic-routes-lab-v-000/app/application.rb @ line 28 Application#call:

     [1;34m4[0m:   [32mdef[0m [1;34mcall[0m(env)
     [1;34m5[0m: 
     [1;34m6[0m:     resp =  [1;34;4mRack[0m::[1;34;4mResponse[0m.new
     [1;34m7[0m:     req  =  [1;34;4mRack[0m::[1;34;4mRequest[0m.new(env)
     [1;34m8[0m:     param = req.path
     [1;34m9[0m: 
    [1;34m10[0m:     [32mif[0m( param.match([31m[1;31m"[0m[31m/items/[1;31m"[0m[31m[0m)) 
    [1;34m11[0m:         [1;34m# if our path has items in it we will do the following[0m
    [1;34m12[0m: 
    [1;34m13[0m:         item_requested = [1;34;4mItem[0m.all.find{|item| param.split([31m[1;31m"[0m[31m/[1;31m"[0m[31m[0m).last == item.name}
    [1;34m14[0m:         [1;34m#where item_requested will have a matched item from Item class[0m
    [1;34m15[0m: 
    [1;34m16[0m:         [32mif[0m(!empty?(item_requested))
    [1;34m17[0m:          resp.write([31m[1;31m"[0m[31m#{item_requested.price}[0m[31m[1;31m"[0m[31m[0m)
    [1;34m18[0m:         [32melse[0m
    [1;34m19[0m:           resp.status = [1;34m400[0m
    [1;34m20[0m:         [32mend[0m
    [1;34m21[0m: 
    [1;34m22[0m:   [32melse[0m
    [1;34m23[0m:       resp.status = [1;34m404[0m
    [1;34m24[0m:     resp.write ([31m[1;31m"[0m[31mRoute not found[1;31m"[0m[31m[0m)
    [1;34m25[0m:     [32mend[0m
    [1;34m26[0m: 
    [1;34m27[0m: resp.finish
 => [1;34m28[0m: binding.pry
    [1;34m29[0m:     
    [1;34m30[0m:        
    [1;34m31[0m:   [32mend[0m

