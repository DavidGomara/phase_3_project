
[1mFrom:[0m /mnt/c/Users/david/OneDrive/Documents/Coding/phase_3/phase_3_project/app/controllers/sessions_controller.rb:30 SessionsController#google:

    [1;34m27[0m: [32mdef[0m [1;34mgoogle[0m
    [1;34m28[0m:     @user = [1;34;4mUser[0m.find_or_create_by([35memail[0m: auth[[31m[1;31m"[0m[31minfo[1;31m"[0m[31m[0m][[31m[1;31m"[0m[31memail[1;31m"[0m[31m[0m]) [32mdo[0m |user| 
    [1;34m29[0m:         user.username = auth[[31m[1;31m"[0m[31minfo[1;31m"[0m[31m[0m][[31m[1;31m"[0m[31mname[1;31m"[0m[31m[0m]
 => [1;34m30[0m:         binding.pry
    [1;34m31[0m:         user.password= [1;34;4mSecureRandom[0m.hex
    [1;34m32[0m:         binding.pry
    [1;34m33[0m:     [32mend[0m 
    [1;34m34[0m:     [32mif[0m @user && @user.id
    [1;34m35[0m:         session[[33m:user_id[0m] = @user.id
    [1;34m36[0m:         redirect_to artists_path 
    [1;34m37[0m:     [32melse[0m 
    [1;34m38[0m:         redirect_to new_user_path
    [1;34m39[0m:     [32mend[0m 
    [1;34m40[0m: [32mend[0m

