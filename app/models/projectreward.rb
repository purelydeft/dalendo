class Projectreward < ApplicationRecord
    
    def self.saveRewards(paramsdata,projectid)
     
     $projectid               = projectid
     $rewardtitle             = paramsdata['title']
     $pledgeAmounts           = paramsdata['rewardamount']
     $reward_descriptions     = paramsdata['reward_desc']
     $reward_shipping_details = paramsdata['reward_shipping_details']
     #$estimated_deliv_month   = paramsdata['estimated_deliv_month']
     $estimated_deliv_month   = ''
        
     $status                  = 'active'
     $created_at              = Time.now.to_s(:db)
     $updated_at              = Time.now.to_s(:db)
     $total_values            = $rewardtitle.count
        
        
      for i in 0..$total_values-1
          $value = Array.new
          $value.push $projectid
          $value.push $rewardtitle[i]
          $value.push $pledgeAmounts[i]
          $value.push $reward_descriptions[i]
          $value.push $reward_shipping_details[i]
          $value.push $estimated_deliv_month[i]
          $value.push $status
          $value.push $created_at 
          $value.push $updated_at

    @connection = ActiveRecord::Base.connection
          result      = @connection.exec_query("INSERT INTO projectrewards (project_id, reward_tile, reward_amount, reward_description, reward_shipping_details, reward_estimated_delivery, status, created_at, updated_at) VALUES (#{ $value.map{ |i| '"%s"' % i }.join(', ') })")
     
        
      end    
         
         return $projectid
    end




    def self.projectbeingeditedrewarddata(paramsdata)

      $projectid  = paramsdata['pid']
      @connection = ActiveRecord::Base.connection
      result      = @connection.exec_query("SELECT * FROM projectrewards WHERE project_id = '#$projectid'")
      return result.to_a

    end
    
    
    
    def self.saveeditRewards(paramsdata)
        
     # Edit Reward Section Data
     $rewardid                     = paramsdata['rewardid']   
     $projectid                    = paramsdata['project_id']
     $edit_rewardtitle             = paramsdata['title']
     $edit_pledgeAmounts           = paramsdata['rewardamount']
     $edit_reward_descriptions     = paramsdata['reward_desc']
     $edit_reward_shipping_details = paramsdata['reward_shipping_details']
     #$edit_estimated_deliv_month   = paramsdata['estimated_deliv_month']
     $edit_estimated_deliv_month   = ''
        
     $status                  = 'active'
     $updated_at              = Time.now.to_s(:db)
     $total_values            = $edit_rewardtitle.count
        
        
      for i in 0..$total_values-1
      $projectid
      $edit_rewardtitle[i]
      $edit_pledgeAmounts[i]
      $edit_reward_descriptions[i] 
      $edit_reward_shipping_details[i]
      $edit_estimated_deliv_month[i]
      $rewardid[i]
          #$value.push $status
      $updated_at

          @connection = ActiveRecord::Base.connection
          
          
          result = @connection.exec_query("UPDATE projectrewards SET reward_tile='#{$edit_rewardtitle[i]}', reward_amount='#{$edit_pledgeAmounts[i]}',reward_description='#{$edit_reward_descriptions[i]}', 	reward_shipping_details='#{$edit_reward_shipping_details[i]}',reward_estimated_delivery='#{$edit_estimated_deliv_month[i]}',updated_at='#$updated_at' WHERE id='#{$rewardid[i]}'")
     
        
      end    
         
            @returngiver = 5
            return @returngiver
        
        
    end    
    
end
