class ProjectFollower < ApplicationRecord
  
  def self.follow_unfollow_project(paramsdata)
    
    $project_id         = paramsdata[:projectid]
    $follower_id        = paramsdata[:userid]
    $notificationstatus = paramsdata[:notificationstatus]
    $created_at         = Time.now.to_s(:db)
    $updated_at         = Time.now.to_s(:db)
    
    @connection = ActiveRecord::Base.connection
    
    is_Already_Follow = @connection.exec_query("SELECT * FROM project_followers WHERE project_id='#{$project_id}' AND follower_id='#{$follower_id}'")
    
    
    if is_Already_Follow.to_a.count > 0
      
     deleteresult = @connection.exec_query("DELETE FROM project_followers WHERE project_id='#{$project_id}' AND follower_id='#{$follower_id}'")
      
        if deleteresult == nil
        
         @returngiver = 2
         return @returngiver
        end
    
    else  
    
    saveresult      = @connection.exec_query("INSERT INTO project_followers (project_id, follower_id, notification_status, created_at, updated_at) VALUES ('#{$project_id}', '#{$follower_id}', '#{$notificationstatus}', '#{$created_at}', '#{$updated_at}')")
    
    end #end else for is_Already_Follow  
    
       if saveresult == nil
      
        @returngiver = 1
        return @returngiver
      
       end
    
  end #Function Ends
  
  
  def self.particular_projectFollow_stat(paramsdata,userid)
    
    $project_id = paramsdata[:pid]
    $follower_id = userid
    
    @connection = ActiveRecord::Base.connection
    
    is_Already_Follow = @connection.exec_query("SELECT * FROM project_followers WHERE project_id='#{$project_id}' AND follower_id='#{$follower_id}'")
    
    return is_Already_Follow.to_a
    
  end #Function Ends
  
  
end
