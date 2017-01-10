class Projectaboutyou < ApplicationRecord



  def self.savingaboutyou(paramsdata,projectid)

    $project_id            = projectid
    $aboutyou_firstname    = paramsdata['aboutyou_firstname']
    $aboutyou_lastname     = paramsdata['about_lastname']
    $aboutyou_structure    = paramsdata['aboutyou_structure']
    $aboutyou_address      = paramsdata['aboutyou_address']
    $aboutyou_country      = paramsdata['aboutyou_country']
    $aboutyou_nationlity   = paramsdata['aboutyou_nationality']
    $aboutyou_phoneno      = paramsdata['aboutyou_phoneno']
    $existing_user_image   = paramsdata['hidden_existing_userImage']
    $status                = 'active'


    # For Project-Image Section
    if paramsdata['aboutyou_image'].present?

      $filename              = paramsdata['aboutyou_image'].original_filename #image name
      $string                = SecureRandom.hex(6) #generate random number

      $original_filename     = "#{$string}_" + $filename


      $uploaded              = paramsdata['aboutyou_image'] # all file data

      File.open(Rails.root.join('app/assets/images/project', 'projectcreator', $original_filename), 'wb') do |file|
        file.write($uploaded.read)
      end

      $creator_image_status  = 'new'


    else

      $original_filename     = $existing_user_image
      $creator_image_status  = 'old'


    end


    # Executing Query Starts For About-You Section
    @connection = ActiveRecord::Base.connection
    resultsaveaboutyou = @connection.exec_query("INSERT INTO projectaboutyous (project_id, project_creator_image , creator_image_status, firstname, lastname, structure, address, country, nationality, phonenumber, status, created_at, updated_at) VALUES ('#$project_id', '#$original_filename', '#$creator_image_status', '#$aboutyou_firstname', '#$aboutyou_lastname', '#$aboutyou_structure', '#$aboutyou_address', '#$aboutyou_country', '#$aboutyou_nationlity', '#$aboutyou_phoneno', '#$status', '#$created_at', '#$updated_at')")

    if resultsaveaboutyou == nil

      return $project_id

    end

  end



  def self.projectbeingeditedaboutyoudata(paramsdata)

    $projectid  = paramsdata['pid']
    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("SELECT * FROM projectaboutyous WHERE project_id = '#$projectid'")
    return result.to_a

  end
    
    
    
  def self.saveeditaboutyou(paramsdata)
    
    $projectid                                    = paramsdata['project_id']     
    $project_about_id                             = paramsdata['project_about_id']     
    $creator_image_status                         = paramsdata['creator_image_status']     
    $edit_aboutyou_firstname                      = paramsdata['aboutyou_firstname']     
    $edit_about_lastname                          = paramsdata['about_lastname']     
    $edit_aboutyou_address                        = paramsdata['aboutyou_address']     
    $edit_aboutyou_structure                      = paramsdata['aboutyou_structure']     
    $edit_aboutyou_country                        = paramsdata['aboutyou_country']     
    $edit_aboutyou_nationality                    = paramsdata['aboutyou_nationality']     
    $edit_aboutyou_phoneno                        = paramsdata['aboutyou_phoneno'] 
    $previous_image                               = paramsdata['hidden_existing_userImage']
    $edited_status                                = 'active' 
    $updated_at                                   = Time.now.to_s(:db)   
      
      
    # For Edit-Project-Image Section
    if paramsdata['aboutyou_image'].present?

      $filename              = paramsdata['aboutyou_image'].original_filename #image name
      $string                = SecureRandom.hex(6) #generate random number

      $original_filename     = "#{$string}_" + $filename


      $uploaded              = paramsdata['aboutyou_image'] # all file data

      File.open(Rails.root.join('app/assets/images/project', 'projectcreator', $original_filename), 'wb') do |file|
        file.write($uploaded.read)
      end

    #Deleting Previous Uploaded Images  
    if File.exist?(Rails.root.join('app/assets/images/project', 'projectcreator', $previous_image))
       File.delete(Rails.root.join('app/assets/images/project', 'projectcreator', $previous_image))
    end  

    else

      $original_filename     = $previous_image


    end #end of image section
      
      
      @connection = ActiveRecord::Base.connection 
      result      = @connection.exec_query("UPDATE projectaboutyous SET project_creator_image='#$original_filename', creator_image_status='#$creator_image_status', firstname='#$edit_aboutyou_firstname', lastname='#$edit_about_lastname', structure='#$edit_aboutyou_structure', address='#$edit_aboutyou_address', country='#$edit_aboutyou_country', nationality='#$edit_aboutyou_nationality', phonenumber= '#$edit_aboutyou_phoneno', status='#$edited_status', updated_at='#$updated_at' WHERE project_id='#$projectid' AND id='#$project_about_id'")
      
       if result == nil
          
           @returngiver = 3
           return @returngiver
       end #end-if
      
      
  end #end-function      

end
