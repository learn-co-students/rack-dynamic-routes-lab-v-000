
[1mFrom:[0m /home/ubuntu/workspace/rack-dynamic-routes-lab-v-000/app/application.rb @ line 6 Application#call:

     [1;34m3[0m: [32mdef[0m [1;34mcall[0m(env)
     [1;34m4[0m:   resp = [1;34;4mRack[0m::[1;34;4mResponse[0m.new 
     [1;34m5[0m:   req = [1;34;4mRack[0m::[1;34;4mRequest[0m.new(env)
 =>  [1;34m6[0m:   binding.pry 
     [1;34m7[0m:   [32mif[0m req.path.match([35m[1;35m/[0m[35mitem[1;35m/[0m[35m[0m) 
     [1;34m8[0m:   [1;34m#  resp.write "#{item_array}"[0m
     [1;34m9[0m: 
    [1;34m10[0m:     [32mif[0m req.path
    [1;34m11[0m:       
    [1;34m12[0m:     [32mend[0m 
    [1;34m13[0m:   [32melse[0m 
    [1;34m14[0m:     resp.write [31m[1;31m"[0m[31mRoute not found[1;31m"[0m[31m[0m
    [1;34m15[0m:     resp.status=[1;34m404[0m
    [1;34m16[0m:   
    [1;34m17[0m:   [32mend[0m 
    [1;34m18[0m:   resp.finish 
    [1;34m19[0m: [32mend[0m 

