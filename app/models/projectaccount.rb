class Projectaccount < ApplicationRecord
    
    
    
    def self.saveaccount(paramsdata,projectid)
        
        
        $projectid       = projectid
        $fullname        = paramsdata['accountholdername']
        $payment_type    = paramsdata['payment_type']
        $bankemail       = paramsdata['accountholderemail']
        $bankname        = paramsdata['bankname']
        $account_number  = paramsdata['accountno']
        $bank_ifsc_code  = paramsdata['ifsccode']
        $account_type    = paramsdata['accounttype']
        $status          = 'active'
        $created_at      = Time.now.to_s(:db)
        $updated_at      = Time.now.to_s(:db)   
        
     # Executing Query Starts For Saving Account Section
    @connection = ActiveRecord::Base.connection
    resultsaveaboutyou = @connection.exec_query("INSERT INTO projectaccounts (project_id, fullname, payment_type, bankemail, bankname, account_number, bank_ifsc_code, account_type, status, created_at, updated_at) VALUES ('#$projectid', '#$fullname', '#$payment_type', '#$bankemail', '#$bankname', '#$account_number', '#$bank_ifsc_code', '#$account_type', '#$status', '#$created_at', '#$updated_at')")

    if resultsaveaboutyou == nil

      returngiver = 5
      return returngiver    

    end       
        
        
    end



    def self.projectbeingeditedaccountdata(paramsdata)

        $projectid  = paramsdata['pid']
        @connection = ActiveRecord::Base.connection
        result      = @connection.exec_query("SELECT * FROM projectaccounts WHERE project_id = '#$projectid'")
        return result.to_a

    end
    
    
    def self.saveeditaccount(paramsdata)
        
        $projectid            = paramsdata['project_id']
        $account_id           = paramsdata['account_id']
        $edit_fullname        = paramsdata['accountholdername']
        $edit_payment_type    = paramsdata['payment_type']
        $edit_bankemail       = paramsdata['accountholderemail']
        $edit_bankname        = paramsdata['bankname']
        $edit_account_number  = paramsdata['accountno']
        $edit_bank_ifsc_code  = paramsdata['ifsccode']
        $edit_account_type    = paramsdata['accounttype']
        $edit_status          = 'active'
        $updated_at           = Time.now.to_s(:db)
        
        
      @connection = ActiveRecord::Base.connection 
      result      = @connection.exec_query("UPDATE projectaccounts SET fullname='#$edit_fullname',  	payment_type='#$edit_payment_type', bankemail='#$edit_bankemail', bankname='#$edit_bankname', account_number='#$edit_account_number', bank_ifsc_code='#$edit_bank_ifsc_code',  	account_type='#$edit_account_type', status='#$edit_status', updated_at='#$updated_at' WHERE project_id='#$projectid' AND id='#$account_id'")
      
       if result == nil
          
           @returngiver = 4
           return @returngiver
       end #end-if
        
    end    
    
    
end
