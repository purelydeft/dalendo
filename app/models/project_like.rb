class ProjectLike < ApplicationRecord
  
  def self.globalmethod(paramsdata)
    
    cat_id        = paramsdata['cat_id']
    lang          = paramsdata['lang']
    project_type  = paramsdata['project_type']
    country       = paramsdata['country']
    tags          = paramsdata['tags']
    filter        = paramsdata['filter']
    sortby        = paramsdata['sortby']
    
#    return page
    
    
    @connection = ActiveRecord::Base.connection   
    
    #getting_result = @connection.exec_query("SELECT * FROM projects WHERE project_id='#{$projectid}' AND liked_by='#{$userid}'") 
    
    getting_result = @connection.exec_query("SELECT * FROM projects WHERE category_id='#{cat_id}'")
      
    return getting_result.to_a
    
    
  end
  
  
  
  def self.like_unlike_working(paramsdata)

  $project_id = paramsdata[:project_id]
  $user_id    = paramsdata[:user_id]
  $status     = '1'
  $created_at = Time.now.to_s(:db)
  $updated_at = Time.now.to_s(:db)

  @connection = ActiveRecord::Base.connection

  is_already_liked = @connection.exec_query("SELECT project_id FROM project_likes WHERE project_id='#{$project_id}' AND liked_by='#{$user_id}'")

    if is_already_liked.to_a.count > 0

      deleteresult = @connection.exec_query("DELETE FROM project_likes WHERE project_id='#{$project_id}' AND liked_by='#{$user_id}'")

      if deleteresult == nil

        @returngiver = 2
        return @returngiver
      end

    else    

    result      = @connection.exec_query("INSERT INTO project_likes (project_id, liked_by, status, created_at, updated_at) VALUES ('#{$project_id}', '#{$user_id}', '#{$status}', '#{$created_at}', '#{$updated_at}')")

    if result == nil

      @returngiver = 1
      return @returngiver

    end

    end   
     
   
   
  end  
 
   
  def self.getlikes_of_current_user(userid,projectid)
     
    $userid   = userid
    $projectid = projectid
     
    @connection = ActiveRecord::Base.connection
     
    getting_result = @connection.exec_query("SELECT * FROM project_likes WHERE project_id='#{$projectid}' AND liked_by='#{$userid}'")
     
    return getting_result.to_a
     
  end
   
end
