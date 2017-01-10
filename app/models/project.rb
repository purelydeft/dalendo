class Project < ApplicationRecord
    
    belongs_to :countries
    
  

#def self.globalmethod(paramsdata)
#    
#    cat_id        = paramsdata['cat_id']
#    lang          = paramsdata['lang']
#    project_type  = paramsdata['project_type']
#    country       = paramsdata['country']
#    tags          = paramsdata['tags']
#    filter        = paramsdata['filter']
#    sortby        = paramsdata['sortby']
#    
##    return page
#    
#    
#    @connection = ActiveRecord::Base.connection   
#    
#    #getting_result = @connection.exec_query("SELECT * FROM projects WHERE project_id='#{$projectid}' AND liked_by='#{$userid}'") 
#    
#    getting_result = @connection.exec_query("SELECT * FROM projects WHERE category_id='#{cat_id}'")
#    
#    @users = paginate_array(getting_result)
#    
#    return @users.to_a
#    
#    
#  end
  
 

  # Saving Project Basic Section
  def self.savingproject(paramsdata)

   # Basic Section Data
   $category_id                      = paramsdata['project_category']
   $project_type                     = paramsdata['projecttype']
   $project_title                    = paramsdata['project_title']
   $project_language                 = paramsdata['project_language']
   $short_desp                       = paramsdata['short_descp']
   $project_location                 = paramsdata['project_location']
   $project_startdate                = paramsdata['project_startdate']
   $project_enddate                  = paramsdata['project_enddate']
   $currency                         = paramsdata['projectcurrency']
   $project_minimum_fundinggoal 	 = paramsdata['min_fundinggoal']
   $project_funding_goal 	         = paramsdata['funding_goal']
   $user_id 	                     = paramsdata['project_user']
   $project_location_latitude        = paramsdata['project_location_latitude']      
   $project_location_longitude       = paramsdata['project_location_longitude']      
   $status                           = 0
   $created_by                       = paramsdata['project_createdby']
   $updated_by                       = paramsdata['project_createdby']
   $created_at                       = Time.now.to_s(:db)
   $updated_at                       = Time.now.to_s(:db)


#   # For Project-Image Section
#   if paramsdata['project_image'].present?
#
#    $filename              = paramsdata['project_image'].original_filename #image name
#    $string                = SecureRandom.hex(6) #generate random number
#
#    $original_filename     = "#{$string}_" + $filename
#
#
#    $uploaded              = paramsdata['project_image'] # all file data
#
#    File.open(Rails.root.join('app/assets/images/project', 'projectimages', $original_filename), 'wb') do |file|
#     file.write($uploaded.read)
#    end
#
#
#   end # Endif


   # Executing Query Starts
   @connection = ActiveRecord::Base.connection
   result      = @connection.exec_query("INSERT INTO projects (category_id, project_type , project_title, short_desp,  	project_location, project_startdate, project_enddate, projectlanguage, currency, project_minimum_fundinggoal, project_funding_goal, user_id, status,  	created_by,
updated_by, created_at, updated_at, project_location_latitude, project_location_longitude) VALUES ('#$category_id', '#$project_type', '#$project_title', '#$short_desp', '#$project_location', '#$project_startdate', '#$project_enddate', '#$project_language', '#$currency', '#$project_minimum_fundinggoal', '#$project_funding_goal', '#$user_id', '#$status', '#$created_by', '#$updated_by', '#$created_at', '#$updated_at', '#$project_location_latitude', '#$project_location_longitude')")

   if result == nil

        result1           = @connection.exec_query("SELECT LAST_INSERT_ID()")
        fetchingprojectid = result1.rows
        @final_last_projectid_inserted = fetchingprojectid.join(', ')

        return @final_last_projectid_inserted
   end


  end



  # Get all Projects
  def self.getallprojects()

   @connection = ActiveRecord::Base.connection
   result      = @connection.exec_query("SELECT * FROM projects ORDER BY id DESC")
   return result.to_a

  end



  def self.projectbeingeditedbasicdata(paramsdata)

    $projectid  = paramsdata['pid']
    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("SELECT * FROM projects WHERE id = '#$projectid'")
    return result.to_a



  end
    
    
    
    ##### Get All Projects On the basis of Category_id
    
    def self.get_projects_by_cat_id(paramsdata)

        $category_id  = paramsdata['cat_id']
        @connection   = ActiveRecord::Base.connection
        result        = @connection.exec_query("SELECT * FROM projects WHERE category_id = '#$category_id'")
        return result.to_a
    end
    
    
    
    ##### Get All Projects On the basis of Category_id
    
    def self.get_projects_by_project_type(paramsdata)

        $project_type  = paramsdata['project_type']
        @connection    = ActiveRecord::Base.connection
        result         = @connection.exec_query("SELECT * FROM projects WHERE project_type = '#$project_type'")
        return result.to_a
    end
    
    
    
  def self.savingeditproject(paramsdata)
      


   # Edit Basic Section Data
   $projectid                               = paramsdata['project_id']       
   $edited_category_id                      = paramsdata['project_category']
   $edited_project_type                     = paramsdata['projecttype']
   $edited_project_title                    = paramsdata['project_title']
   $edited_project_language                 = paramsdata['project_language']
   $edited_short_desp                       = paramsdata['short_descp']
   $edited_project_location                 = paramsdata['project_location']
   $edited_project_startdate                = paramsdata['project_startdate']
   $edited_project_enddate                  = paramsdata['project_enddate']
   $edited_currency                         = paramsdata['projectcurrency']
   $edited_project_minimum_fundinggoal 	    = paramsdata['min_fundinggoal']
   $edited_project_funding_goal 	        = paramsdata['funding_goal']
   $edited_user_id 	                        = paramsdata['project_user']
   $project_location_latitude               = paramsdata['project_location_latitude']       
   $project_location_longitude              = paramsdata['project_location_longitude']       
   $edited_status                           = paramsdata['project_main_status']
   $updated_by                              = paramsdata['project_createdby']
   $updated_at                              = Time.now.to_s(:db)
        
   $previous_project_image                  = paramsdata['previous_project_image']
      
      
      
   #Checking Image Is new or old condition starts
      
    if paramsdata['project_image'].present?

    $filename              = paramsdata['project_image'].original_filename #image name
    $string                = SecureRandom.hex(6) #generate random number

    $original_filename     = "#{$string}_" + $filename


    $uploaded              = paramsdata['project_image'] # all file data

    File.open(Rails.root.join('app/assets/images/project', 'projectimages', $original_filename), 'wb') do |file|
     file.write($uploaded.read)
    end
      
    #Deleting Previous Uploaded Image  
    if File.exist?(Rails.root.join('app/assets/images/project', 'projectimages', $previous_project_image))
      File.delete(Rails.root.join('app/assets/images/project', 'projectimages', $previous_project_image))
    end  


   else
      
   $original_filename      = $previous_project_image
      
   end #mainif End
   
      
      
    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("UPDATE projects SET category_id='#$edited_category_id', project_type='#$edited_project_type', project_title='#$edited_project_title', project_image='#$original_filename', short_desp='#$edited_short_desp', project_location='#$edited_project_location', project_startdate='#$edited_project_startdate', project_enddate='#$edited_project_enddate',  	projectlanguage='#$edited_project_language', currency='#$edited_currency',  	project_minimum_fundinggoal='#$edited_project_minimum_fundinggoal', project_funding_goal='#$edited_project_funding_goal', user_id='#$edited_user_id', status='#$edited_status', updated_by='#$updated_by', updated_at='#$updated_at', project_location_latitude='#$project_location_latitude', project_location_longitude='#$project_location_longitude' WHERE id='#$projectid'")
      
      if result == nil
         
          returngiver = 1
          return returngiver
          
      end
      
  end #Function Ends



  def self.changeprojectstatus(paramsdata)
      
      $project_id    = paramsdata['projectid']
      $projectstatus = paramsdata['finalstatus']

      if $projectstatus == 'Approved'
         
          $changestatus = '1' 
          
      elsif $projectstatus == 'Disapproved'      
         
          $changestatus = '2'
          
      else
          
          $changestatus = '3'
          
      end
          
      
        @connection = ActiveRecord::Base.connection
        result      = @connection.exec_query("UPDATE projects SET status='#$changestatus' WHERE id='#$project_id'")
    
      if result == nil

        returngiver = 1
        return returngiver

      end  

  end #Function Ends 




  def self.get_user_allProjects(userid)
      
    $userid = userid 
    @connection = ActiveRecord::Base.connection
    result      = @connection.exec_query("SELECT * FROM projects WHERE user_id = '#$userid'")
    return result.to_a 
      
  end #Function Ends  

  
   def self.saveimage(paramsdata)
      
     
    $uploaded_pics = paramsdata['test_image']
    $string        = SecureRandom.hex(6) #generate random number
    Dir.mkdir(Rails.root.join('app/assets/images/project/' + 'Sambhav'))
    $uploaded_pics.each do |pic|

    $original_filename = "#{$string}_" + pic.original_filename       
    File.open(Rails.root.join('app/assets/images/project', 'dummyimages', $original_filename), 'wb') do |file|
    file.write(pic.read)
    end  
       
       
       
#    $filename              = paramsdata['project_image'].original_filename #image name
#    $string                = SecureRandom.hex(6) #generate random number
#
#    $original_filename     = "#{$string}_" + $filename
#
#
#    $uploaded              = paramsdata['project_image'] # all file data
#
#    File.open(Rails.root.join('app/assets/images/project', 'projectimages', $original_filename), 'wb') do |file|
#     file.write($uploaded.read)
#    end
           
    end       
       



  end      


 
end
