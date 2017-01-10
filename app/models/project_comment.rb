class ProjectComment < ApplicationRecord
    
  def self.getProjectComments(paramsdata)
      
      $project_id = paramsdata['pid']
      $status      = '0' #Means Comment is active 
      @connection = ActiveRecord::Base.connection    
      result      = @connection.exec_query("SELECT * FROM project_comments WHERE project_id = '#$project_id' AND status = '#$status'")      
      
      
      return result.to_a
      
  end
  # Function     
    
end
