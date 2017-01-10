class Badge < ApplicationRecord

  #Function For Adding Categories
  def self.addbadge(paramsdata)

    $created_at          = Time.now.to_s(:db)
    $updated_at          = Time.now.to_s(:db)
    $badgename           = paramsdata['addbadges']['badgename']
    $badgedescription    = paramsdata['addbadges']['badge_decription']
    $badgestatus         = paramsdata['addbadges']['badges_status']

    if paramsdata['badge_image'].present?

      $filename              = paramsdata['badge_image'].original_filename #image name
      $string                = SecureRandom.hex(6) #generate random number

      $original_filename     = "#{$string}_" + $filename


      $uploaded              = paramsdata['badge_image'] # all file data

      File.open(Rails.root.join('app/assets/images/backend', 'badgeimages', $original_filename), 'wb') do |file|
        file.write($uploaded.read)
      end


    end

    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("INSERT INTO badges (badge_name, badge_description, badge_image, badge_status, created_at, updated_at) VALUES ('#$badgename', '#$badgedescription', '#$original_filename', '#$badgestatus', '#$created_at', '#$updated_at')")

    if result == nil

      returngiver = 1
      return returngiver

    end
  end



  #Function For Getting All-categories
  def self.getallbadges()

    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("SELECT * FROM badges ORDER BY id DESC")
    return result.to_a

  end


  #Function For Getting Single-Badge
  def self.singlebadgeData(paramsdata)

    $badgeid    = paramsdata[:bid]
    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("SELECT * FROM badges WHERE id='#$badgeid'")
    return result.to_a

  end



  #Function For Delete Single-Badge
  def self.deletebadge(paramsdata)

    $badgeid    = paramsdata[:badgeid]
    $badgeimage = paramsdata[:badgeimage]

    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("DELETE FROM badges WHERE id='#$badgeid'")

    if File.exist?(Rails.root.join('app/assets/images/backend', 'badgeimages', $badgeimage))
      File.delete(Rails.root.join('app/assets/images/backend', 'badgeimages', $badgeimage))
    end

    if result == nil

      returngiver = 1
      return returngiver

    end

  end



  #Function Starts For Editing Badges
  def self.editBadgestarts(paramsdata)

    $badgeid              = paramsdata['editbadges']['hidden_badgeid']
    $editedbadgename      = paramsdata['editbadges']['editbadgename']
    $editedbadgedesc      = paramsdata['editbadges']['editbadge_decription']
    $editedbadgestatus    = paramsdata['editbadges']['edit_badges_status']
    $previous_badgeImage  = paramsdata['editbadges']['previousHidden_badgeImage']
    $updated_at           = Time.now.to_s(:db)


     if paramsdata['edit_badge_images'].present?

       $filename              = paramsdata['edit_badge_images'].original_filename #image name
       $string                = SecureRandom.hex(6) #generate random number

       $original_filename     = "#{$string}_" + $filename


       $uploaded              = paramsdata['edit_badge_images'] # all file data

       File.open(Rails.root.join('app/assets/images/backend', 'badgeimages', $original_filename), 'wb') do |file|
         file.write($uploaded.read)
       end

        if File.exist?(Rails.root.join('app/assets/images/backend', 'badgeimages', $previous_badgeImage))

          File.delete(Rails.root.join('app/assets/images/backend', 'badgeimages', $previous_badgeImage))

        end

     else

       $original_filename = $previous_badgeImage

     end

    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("UPDATE badges SET badge_name='#$editedbadgename', badge_description='#$editedbadgedesc', badge_image='#$original_filename', badge_status='#$editedbadgestatus', updated_at='#$updated_at' WHERE id='#$badgeid'")

    if result == nil

      returngiver = 1
      return returngiver

    end

  end
    
    
    
    
    def self.changebadgeStatus(paramsdata)
        
        $badgeid     = paramsdata['badgeid']
        $badgestatus = paramsdata['badgestatus']
        
        if $badgestatus == 'active'
           
            $finalstatus = 'inactive' 
            
            @connection = ActiveRecord::Base.connection
            result      = @connection.exec_query("UPDATE badges SET badge_status='#$finalstatus' WHERE id='#$badgeid'")
        
            if result == nil

            returngiver = 1
            return returngiver

            end #Endif  
            
        else
            
            $finalstatus = 'active' 
            
            @connection = ActiveRecord::Base.connection
            result      = @connection.exec_query("UPDATE badges SET badge_status='#$finalstatus' WHERE id='#$badgeid'")
        
            if result == nil

            returngiver = 2
            return returngiver

            end #Endif  

        end #Endif
        
         
        
    end

end
