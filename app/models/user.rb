class User < ApplicationRecord
    
# ------------ START ADMIN-LOGIN FUNCTION --------------
    
    
    def self.usersignin(paramsdata)
        
        $email              = paramsdata['adminemail']
        $encrypted_password = Digest::MD5.hexdigest(paramsdata['adminpassword'])
        $userstatus = 'active'
        
        @connection = ActiveRecord::Base.connection
        
        result = @connection.exec_query("SELECT * FROM users WHERE email = '#$email' AND password = '#$encrypted_password'")
        return result.to_a


    end
    
    
    
# ------------ END ADMIN_LOGIN FUNCTION --------------
    
    def self.useradd(paramsdata,register_ip)
        
        $name           = paramsdata['adduser']['name']
        
        arr = $name.split(' ')
        
        $first = arr[0]
        $last = arr[1]
                        
        $username       = paramsdata['adduser']['username']
        $useremail      = paramsdata['adduser']['useremail']
        $password       = paramsdata['adduser']['userpassword']
        
        $encrypted_password = Digest::MD5.hexdigest($password) #Md5 Password Encrypted Here
        
        $address        = paramsdata['adduser']['address']
        $contactno      = paramsdata['adduser']['contactno']
        $country        = paramsdata['user_country']
        $state          = paramsdata['adduser']['state']
        $userrole       = paramsdata['adduser']['userrole']
        $fblink         = paramsdata['adduser']['fblink']
        $twitterlink    = paramsdata['adduser']['twitterlink']
        $linkedinlink   = paramsdata['adduser']['linkedinlink']
        
        $register_ip           
        
        #return $register_ip
        
        $created_at            = Time.now.to_s(:db)        
        $updated_at            = Time.now.to_s(:db)
        $user_status           = 'active'

        $filename       = paramsdata['adduser']['userimage'].original_filename #image name
        
        $string         = SecureRandom.hex(6) #generate random number
        
        $original_filename     = "#{$string}_" + $filename
                
        $uploaded              = paramsdata['adduser']['userimage'] # all file data
        
        File.open(Rails.root.join('app/assets/images', 'UserImages', $original_filename), 'wb') do |file|
        file.write($uploaded.read)
        end
       

        @connection = ActiveRecord::Base.connection    
        result      = @connection.exec_query("INSERT INTO users (first_name, last_name, user_name, email, password, address, phone_number, country, state, user_role, register_ip, facebook_link, twitter_link, linkedin_link, user_image, user_status, created_at, updated_at) VALUES ('#$first', '#$last', '#$username', '#$useremail', '#$encrypted_password', '#$address', '#$contactno', '#$country', '#$state', '#$userrole', '#$register_ip', '#$fblink', '#$twitterlink', '#$linkedinlink', '#$original_filename', '#$user_status', '#$created_at', '#$updated_at')")

         if result == nil

          returngiver = 1     
          return returngiver

         end
        
    end
    
# ------------------- END ADD USER FUNCTION ---------------------
    
    
    
# ------------------ START GET ALL-USERS FUNCTION --------------------
        
    def self.getusers()
  
        @connection = ActiveRecord::Base.connection
        result      = @connection.exec_query("SELECT * FROM users ORDER BY id DESC")
        return result.to_a
     
    end
        
# ------------------- END GET ALL-USERS FUNCTION ---------------------
    
    
    

# ------------------ START GET SINGLE-USER FUNCTION --------------------
        
    def self.getsingleusers(paramsdata)
        
        $userid     = paramsdata['uid']
        
        @connection = ActiveRecord::Base.connection
        result      = @connection.exec_query("SELECT * FROM users WHERE id='#$userid'")
        return result.to_a
     
    end
        
# ------------------- END GET SINGLE-USER FUNCTION ---------------------
    
    
    
    
    
    
    
# ------------ START UPDATE USER FUNCTION --------------
    
    def self.updateuser(paramsdata,register_ip)
        
        
        $userid         = paramsdata['edituser']['userid']
        $name           = paramsdata['edituser']['name']
        
        $register_ip
        
        arr = $name.split(' ')
        
        $first = arr[0]
        $last = arr[1]
        
#        return $userid
        
        $username       = paramsdata['edituser']['username']
        $useremail      = paramsdata['edituser']['useremail']
        $address        = paramsdata['edituser']['address']
        $contactno      = paramsdata['edituser']['contactno']
        $country        = paramsdata['edituser_country']
        $state          = paramsdata['edituser']['state']
        $userrole       = paramsdata['edituser']['userrole']
        $fb_link        = paramsdata['edituser']['fb_link']
        $twitter_link   = paramsdata['edituser']['twitter_link']
        $linkedin_link  = paramsdata['edituser']['linkedin_link']
        
        $hidden_user_image   = paramsdata['edituser']['hidden_user_image']
        $userimage           = paramsdata['edituser']['userimage']
        
        
#        return $userimage
        
        $created_at            = Time.now.to_s(:db)
        $updated_at            = Time.now.to_s(:db)
        
        if $userimage != nil # Start userimage condition
                            
            $filename               = paramsdata['edituser']['userimage'].original_filename # image name
            $string                 = SecureRandom.hex(6) #generate random number
            
            $original_filename      = "#{$string}_" + $filename
            
            $uploaded               = paramsdata['edituser']['userimage'] # all file data

            File.open(Rails.root.join('app/assets/images', 'userImages', $original_filename), 'wb') do |file|
            file.write($uploaded.read)
            end
            
            if $userimage == nil # Start Unlink condition
            
                File.delete(Rails.root.join('app/assets/images', 'userImages', $hidden_user_image))
            
            end # End Unlink condition
            
        else
            $original_filename =  paramsdata['edituser']['hidden_user_image'] # image name
        end 
        
        # End userimage condition
        

        @connection = ActiveRecord::Base.connection       
        
        result      = @connection.exec_query("UPDATE users SET first_name='#$first', last_name='#$last', user_name='#$username', email='#$useremail', address='#$address', phone_number='#$contactno', country='#$country', state='#$state', register_ip='#$register_ip', user_role='#$userrole', facebook_link='#$fb_link', twitter_link='#$twitter_link', linkedin_link='#$linkedin_link', user_image='#$original_filename' WHERE id='#$userid'")

         if result == nil

          returngiver = 1     
          return returngiver

         end
        
    end
    
# ------------------- END UPDATE USER FUNCTION ------------------------
    
    
    
    
    
    
# ------------------- START DELETE-USER FUNCTION ---------------------
    
    def self.deleteUserByadmin(paramsdata)
        
        $userid = paramsdata['userid']
        $profileimagename = paramsdata['profileimage']
        
        @connection = ActiveRecord::Base.connection
        result      = @connection.exec_query("DELETE FROM users WHERE id='#$userid'")
    
        File.delete(Rails.root.join('app/assets/images', 'userImages', $profileimagename))
        
        if result == nil
      
            returngiver = 1
            return returngiver      
    
        end
        
    end
    
# ------------------- END DELETE-USER FUNCTION ---------------------
    
    
    
    
    
# ------------------- START ACTIVE/INACTIVE-USER FUNCTION ---------------------
    
    
    
    def self.changeuserStatus(paramsdata)
   
    $userid     = paramsdata['uid']
        
    @connection = ActiveRecord::Base.connection
     
    if paramsdata['status'] == 'active'
    
    $userstatus = 'inactive'    
    result      = @connection.exec_query("UPDATE users SET user_status='#$userstatus' WHERE id='#$userid'")
    
     if result == nil
     
      returngiver = 1     
      return returngiver
         
     end
    
    else #else of paramsdata['userstatus']
        
    $userstatus = 'active'    
    result      = @connection.exec_query("UPDATE users SET user_status='#$userstatus' WHERE id='#$userid'")
    
     if result == nil
     
      returngiver = 2     
      return returngiver
         
     end       
    end # end of paramsdata['usertatus']
     
 end
    
    
    
# ------------------- END ACTIVE/INACTIVE-USER FUNCTION ---------------------
    
    
    
    
    
# ------------------- START USER EMAIL VERIFICATION FUNCTION -------------------
    
    
    
    def self.emailverification(randomcode)

        $registercode = randomcode
        $userstatus = 'active'
        @connection = ActiveRecord::Base.connection
        result      = @connection.exec_query("UPDATE users SET user_status='#$userstatus' WHERE registercode='#$registercode'")

        if result == nil

            @gettingdataofUser = @connection.exec_query("SELECT * FROM users WHERE registercode = '#$registercode'")

            return @gettingdataofUser
            
        end

     end    
    
    
# ------------------- END USER EMAIL VERIFICATION FUNCTION ---------------------
    
    
    
    
    

    
    # ------------------- For Twitter Login ---------------------
    
   
    
    def self.from_omniauth(auth_hash)
        
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.url = auth_hash['info']['urls']['Twitter']
    user.save!
    user
        
  end

    
    # ------------------- For Twitter Login ---------------------
    
    
     
    
end
