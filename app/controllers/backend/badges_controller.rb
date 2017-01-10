module Backend
class BadgesController < ApplicationController

  skip_before_action :verify_authenticity_token
  layout 'backend'
    
  #Making global function for render view of badges    
  def self.controller_path
      
    "backend/badges"
      
  end
    
    
  def badgesmanagement

  if session[:current_user_id] != nil #Checking if session Exist

    @getallbadges = Badge.getallbadges()
    #@getallbadges = Badge.paginate(:page => params[:page], :per_page => 5)

  else
    redirect_to backend_dalendo_admin_path #redirct if session is out
  end
  end 
  #Function Ends

    
      
  def addbadges

  if session[:current_user_id] != nil #Checking if session Exist

    if params.has_key?(:addbadges)

      @insertBadges = Badge.addbadge(params)

      if @insertBadges == 1

        #redirect_to backend_badges_management_path, flash: {success: "User Has been saved."}
          
        flash[:success] = "Success, Badge Has been saved."
        render plain: @insertBadges.inspect
          

      end #end-if
    end #end-if

  else
   redirect_to backend_dalendo_admin_path #redirct if session is out
  end #Session if ends

  end
  #Function Ends


    
  
  def viewbadges

    if session[:current_user_id] != nil #Checking if session Exist


    @singlebadgeData = Badge.singlebadgeData(params)

    else
      redirect_to backend_dalendo_admin_path #redirct if session is out
    end #Session if ends

  end
  #Function Ends


    
  
  def editbadges

    if session[:current_user_id] != nil #Checking if session Exist

      @singlebadgeData = Badge.singlebadgeData(params)

      if params.has_key?(:editbadges)

        @editBadgestarts = Badge.editBadgestarts(params)

          flash[:updated] = "Success, Badge Has been updated."
        render plain: @editBadgestarts.inspect

      end

    else

      redirect_to backend_dalendo_admin_path #redirct if session is out

    end #Session if ends

  end
  #Function Ends



  def deletebadges

    if session[:current_user_id] != nil #Checking if session Exist
    @deletebadge = Badge.deletebadge(params)

    if @deletebadge == 1

      render plain: @deletebadge.inspect

    end

    else

      redirect_to backend_dalendo_admin_path #redirct if session is out

    end #Session if ends

  end
  #Function Ends
    
    
    
    def changebadgestatus
        
       changebadgeStatus = Badge.changebadgeStatus(params)
        
       if changebadgeStatus == 1
           flash[:status_inactive] = "Success, Badge status has been changed to Inactive"
                
        elsif changebadgeStatus == 2
            flash[:status_active] = "Success, Badge status has been changed to Active"
        end
        
       render plain: changebadgeStatus.inspect         
        
    end
    #Function Ends    
    
    
    

end
    
end    
