class Projectstory < ApplicationRecord



  def self.savingstory(paramsdata,projectid)

    # Story Section Data
    $project_id                       = projectid
    $project_desc                     = paramsdata['project_desc']
    $project_risk                     = paramsdata['project_risk']
    $story_status                     = 'active'
    $created_at                       = Time.now.to_s(:db)
    $updated_at                       = Time.now.to_s(:db)

    # For Story Project-Video Section
    if paramsdata['project_video'].present?

      $filename                   = paramsdata['project_video'].original_filename #image name
      $string                     = SecureRandom.hex(6) #generate random number

      $originalvideo_filename     = "#{$string}_" + $filename


      $uploaded                   = paramsdata['project_video'] # all file data

      File.open(Rails.root.join('app/assets/images/project', 'projectvideos', $originalvideo_filename), 'wb') do |file|
        file.write($uploaded.read)
      end



    end

    # Executing Query Starts For Story Section
    @connection = ActiveRecord::Base.connection
    resultsavestory      = @connection.exec_query("INSERT INTO projectstories (project_id, project_video , project_description, project_risk, status, created_at, updated_at) VALUES ('#$project_id', '#$originalvideo_filename', '#$project_desc', '#$project_risk', '#$story_status', '#$created_at', '#$updated_at')")

    if resultsavestory == nil

       return $project_id

    end


end



  def self.projectbeingeditedstorydata(paramsdata)

    $projectid  = paramsdata['pid']
    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("SELECT * FROM projectstories WHERE project_id = '#$projectid'")
    return result.to_a

  end
    
    
    
  def self.savingeditstory(paramsdata)
      
      
       $projectid                               = paramsdata['project_id']
       $story_id                                = paramsdata['story_id']
       $edited_project_desc                     = paramsdata['project_desc']
       $edited_project_risk                     = paramsdata['project_risk']
       $edited_project_desc                     = paramsdata['project_desc']
       $previous_uploaded_video                 = paramsdata['previous_uploaded_video']
       $updated_at                              = Time.now.to_s(:db)
       $edited_status                           = 'active'
      
    # For edit Story Project-Video Section
    if paramsdata['project_video'].present?

      $filename                   = paramsdata['project_video'].original_filename #image name
      $string                     = SecureRandom.hex(6) #generate random number

      $originalvideo_filename     = "#{$string}_" + $filename


      $uploaded                   = paramsdata['project_video'] # all file data

      File.open(Rails.root.join('app/assets/images/project', 'projectvideos', $originalvideo_filename), 'wb') do |file|
        file.write($uploaded.read)
      end

    #Deleting Previous Uploaded Video  
    if File.exist?(Rails.root.join('app/assets/images/project', 'projectvideos', $previous_uploaded_video))
       File.delete(Rails.root.join('app/assets/images/project', 'projectvideos', $previous_uploaded_video))
    end  

        
    else
        
        $originalvideo_filename   = $previous_uploaded_video 
        
    end    
        
      @connection = ActiveRecord::Base.connection 
      result      = @connection.exec_query("UPDATE projectstories SET project_video='#$originalvideo_filename', project_description='#$edited_project_desc', project_risk='#$edited_project_risk',  	status='#$edited_status', updated_at='#$updated_at' WHERE project_id='#$projectid' AND id='#$story_id'")
      
       if result == nil
          
           @returngiver = 2
           return @returngiver
       end
    
    end #Function Ends  
      
      
      

  end
