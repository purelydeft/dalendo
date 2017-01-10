class ProjectFile < ApplicationRecord
    
    
    def self.savingfiles(paramsdata,projectid)
        
     $project_id = projectid
     $status     = 1
     $created_at = Time.now.to_s(:db)
     $updated_at = Time.now.to_s(:db)
        
     #Main Condition Starts Here
     if paramsdata['project_image'].present?
         
         $uploaded_pics = paramsdata['project_image']
         #$string        = SecureRandom.hex(6) #generate random number
         $string         = p SecureRandom.urlsafe_base64(5)
         $image_path    = 'project/' + $project_id + '/project_images' 
         $file_type     = 'image'        
            #@return = 'app/assets/images/project/', $project_id, '/', $original_filename
            #return @return
        Dir.mkdir(Rails.root.join('app/assets/images/project/' + $project_id)) #Making Main-Directory
        Dir.mkdir(Rails.root.join('app/assets/images/project/' + $project_id + '/project_images')) #Making Sub-Directory

        $uploaded_pics.each do |pic|

        $original_filename = "#{$string}_" + pic.original_filename   

        File.open(Rails.root.join('app/assets/images/project/' + $project_id + '/project_images/' + $original_filename), 'wb') do |file|
        file.write(pic.read)
        end          

        @connection = ActiveRecord::Base.connection
        saveProjectFiles = @connection.exec_query("INSERT INTO project_files (project_id, project_file_name,  	project_file_type, project_image_path, status, created_at, updated_at) VALUES ('#$project_id', '#$original_filename', '#$file_type', '#$image_path', '#$status', '#$created_at', '#$updated_at')")

        end #End Foreach
        
        return $project_id  
       end


    end #Function Ends 



    def self.savingVideofiles(paramsdata,projectid)
        
            
     $project_id = projectid
     $status     = 1
     $created_at = Time.now.to_s(:db)
     $updated_at = Time.now.to_s(:db)    
            
     if paramsdata['project_video'].present?

        $uploaded_pics = paramsdata['project_video']
        #$string        = SecureRandom.hex(6) generate random number
        $string         = p SecureRandom.urlsafe_base64(5)   
        $video_path    = 'project/' + $project_id + '/project_videos' 
        $file_type     = 'video'        

        Dir.mkdir(Rails.root.join('app/assets/images/project/' + $project_id + '/project_videos')) #Making Sub-Directory

        $uploaded_pics.each do |video|

        $original_filename = "#{$string}_" + video.original_filename   

        File.open(Rails.root.join('app/assets/images/project/' + $project_id + '/project_videos/' + $original_filename), 'wb') do |file|
        file.write(video.read)
        end          

        @connection = ActiveRecord::Base.connection
        saveProjectFiles = @connection.exec_query("INSERT INTO project_files (project_id, project_file_name,  	project_file_type, project_image_path, status, created_at, updated_at) VALUES ('#$project_id', '#$original_filename', '#$file_type', '#$video_path', '#$status', '#$created_at', '#$updated_at')")

        end #End Foreach



        return $project_id        
        
      end  
        
    end
    
    
end
