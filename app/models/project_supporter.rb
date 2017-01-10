class ProjectSupporter < ApplicationRecord
    
    
 def self.getProjectsupporters(paramsdata)
  
    $project_id = paramsdata['pid']
    $status      = '1' #Means Comment is active 
    @connection = ActiveRecord::Base.connection    
    result      = @connection.exec_query("SELECT * FROM project_supporters WHERE project_id = '#$project_id' AND status = '#$status'")      


    return result.to_a    
     
     
     
 end
 #Function Ends
 
 def self.particular_projectSupporter_stat(paramsdata,userid)

 $project_id = paramsdata[:pid]
 $supporter_id = userid

 @connection = ActiveRecord::Base.connection

 is_Already_Supporter_Data = @connection.exec_query("SELECT * FROM project_supporters WHERE project_id='#{$project_id}' AND supported_by='#{$supporter_id}'")

 return is_Already_Supporter_Data.to_a

 end
 #Function Ends   
 
 
 def self.support_unsupport_project(paramsdata)
   
    $project_id          = paramsdata[:projectid]
    $supporter_id        = paramsdata[:userid]
    $status              = '1'
    $created_at          = Time.now.to_s(:db)
    $updated_at          = Time.now.to_s(:db)  
    
     @connection = ActiveRecord::Base.connection
    
    is_Already_Supporter = @connection.exec_query("SELECT * FROM project_supporters WHERE project_id='#{$project_id}' AND supported_by='#{$supporter_id}'")
    
    
    if is_Already_Supporter.to_a.count > 0
      
     deleteresult = @connection.exec_query("DELETE FROM project_supporters WHERE project_id='#{$project_id}' AND supported_by='#{$supporter_id}'")
      
        if deleteresult == nil
        
         @returngiver = 2
         return @returngiver
        end
    
    else  
    
    saveresult      = @connection.exec_query("INSERT INTO project_supporters (project_id, supported_by, status, created_at, updated_at) VALUES ('#{$project_id}', '#{$follower_id}', '#{$status}', '#{$created_at}', '#{$updated_at}')")
    
    end #end else for is_Already_Follow  
    
       if saveresult == nil
      
        @returngiver = 1
        return @returngiver
      
       end  
   
 end
 #Function Ends   
end
