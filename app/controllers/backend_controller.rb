class BackendController < ApplicationController
    
    skip_before_action :verify_authenticity_token
    before_filter :set_cache_buster
    require 'securerandom'
    
#    helper_method :sort_column, :sort_direction

    def set_cache_buster
        response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end

    
    
    def index
    
        render layout: false

    end
    #Function Ends
    
    
    
    def adminlogin
        
        #render plain: params.inspect
        
        @adminLoginfunction = User.usersignin(params) # Admin sign-in function
        
        #render plain: @adminLoginfunction.inspect

        if @adminLoginfunction.count > 0

            if @adminLoginfunction[0]['user_role'] == 'admin'

                session[:current_user_id]            = @adminLoginfunction[0]['id']
                session[:current_user_firstname]     = @adminLoginfunction[0]['first_name']
                session[:current_user_lastname]      = @adminLoginfunction[0]['last_name']   #Storing Data in Session
                session[:current_user_email]         = @adminLoginfunction[0]['email']
                session[:current_user_image]         = @adminLoginfunction[0]['user_image']
                session[:current_user_address]       = @adminLoginfunction[0]['address']
                session[:current_user_country]       = @adminLoginfunction[0]['country']
                session[:current_user_phonenumber]   = @adminLoginfunction[0]['phone_number']

                
                if params['remember_me'] == '1'
                    
                    cookies[:userid]         = @adminLoginfunction[0]['id']
                    cookies[:adminemail]     = { value: params['adminemail'], expires: 2.weeks.from_now }
                    cookies[:adminpassword]  = { value: params['adminpassword'], expires: 2.weeks.from_now }
                    
                end
                
                

                @returngiver = 1
                render plain: @returngiver.inspect

            else #else of @adminLoginfunction role

                @returngiver = 2
                render plain: @returngiver.inspect 

            end #end of @adminLogin role

        else #else of @adminLoginfunction.count

          @returngiver = 2

            render plain: @returngiver.inspect

        end  #end of @adminLoginfunction.count

    end
    #Function Ends
    
    
    
    def dashboard
        
        if session[:current_user_id] != nil

            @allcategoriesCount      = Category.getallcategories().count
            @getUserscount           = User.getusers().count
            @getProjectscount        = Project.getallprojects().count
         
        else
         
            redirect_to :action => 'index'  
        end
    
    
    end
    #Function Ends
    
    
    def usermanagement
        
        if session[:current_user_id] != nil
        
            @getUsers = User.getusers()
            
            #@getUsers = User.paginate(:page => params[:page], :per_page => 5) #   
            
            #@getUsers = User.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
                        
        else
         
            redirect_to :action => 'index'  
        end
                
    end
    #Function Ends
    
    
    def adduser
        
        if session[:current_user_id] != nil
            
           @allcountriesAndNationalty = Country.all 
         
        else
         
            redirect_to :action => 'index'  
        end
        
        
    end
    #Function Ends
    
    
    
    def useradd
        
        
        #render plain: params.inspect
        
        if session[:current_user_id] != nil
            
            $register_ip    = request.remote_ip
        
            @insertUser = User.useradd(params,$register_ip)

            #render plain: @insertUser.inspect

            if @insertUser == 1

                #redirect_to :action => 'usermanagement'
                redirect_to backend_user_management_path, flash: {success: "User Has been saved."}

            end
            
        else
         
            redirect_to :action => 'index'  
        end
        
    end
    #Function Ends
    
   
    def viewsingleuser
        
        if session[:current_user_id] != nil
        
            @getsingleUser = User.getsingleusers(params)

            #render plain: @getsingleUser.inspect
            
        else
         
            redirect_to :action => 'index'  
        end
        
    end
    #Function Ends  
    
    
    def changeUserstatus
        
        if session[:current_user_id] != nil
      
            @changingUserstatus = User.changeuserStatus(params)

           #render plain: @changingUserstatus.inspect

            if @changingUserstatus == 1

                redirect_to :action => 'usermanagement'
            end
            
        else
         
            redirect_to :action => 'index'  
        end
      
    end
    #Function Ends  
    
    
    def edituser
        
        if session[:current_user_id] != nil
        
            @getsingleUser = User.getsingleusers(params)
            @allcountriesAndNationalty = Country.all 
            
            #render plain: @getsingleUser.inspect
        
        else
         
            redirect_to :action => 'index'  
        end
        
    end
    #Function Ends
    
    
    def updateuser
        
        if session[:current_user_id] != nil
            
            $register_ip    = request.remote_ip
        
            @updateUser = User.updateuser(params,$register_ip)

            #render plain: @updateUser.inspect

            if @updateUser == 1

                #redirect_to :action => 'usermanagement'
                redirect_to backend_user_management_path, flash: {updated: "User Has been updated."}

            end 
            
        else
         
            redirect_to :action => 'index'  
        end
        
    end
    #Function Ends
    
    
    def deleteUser
        
        if session[:current_user_id] != nil
      
            @deleteUserByadmin = User.deleteUserByadmin(params)

            #flash[:deleted] = "Success, User Has been deleted."
            render plain: @deleteUserByadmin.inspect
            
        else
         
            redirect_to :action => 'index'  
        end
      
    end
    #Function Ends
    
    
    
    
    def categorymanagement

        if session[:current_user_id] != nil

         @getallcategories = Category.getallcategories()
         
          #@getallcategories = Category.paginate(:page => params[:page], :per_page => 5)
          #render plain: @getallcategories.inspect

        else

            redirect_to :action => 'index'
        end
        
    end
    #Function Ends
    
    
    def addcategory

     if session[:current_user_id] != nil

         if params.has_key?(:addcategory)
          
         @insertCategory = Category.addcategory(params)
            
          if @insertCategory == 1
              
              flash[:addcategory] = "Success, Your category has been added"    
              render plain: @insertCategory.inspect

          end
            
         end
     else
         redirect_to :action => 'index'
     end
                
    end
    #Function Ends
    
    
    
    def viewcategory

     if session[:current_user_id] != nil
        @sinlecategoryData = Category.sinlecategoryData(params)

     else
         redirect_to :action => 'index'
     end
    end
    #Function Ends
    
    
    
    def editcategory

      if session[:current_user_id] != nil

        @editsinglecategoryData = Category.sinlecategoryData(params)

        if params.has_key?(:editcategory)

        @editCategorystarts = Category.editCategorystarts(params)

        flash[:editcategory] = "Success, Your category has been updated"     
        render plain: @editCategorystarts.inspect

        end
      else
          redirect_to :action => 'index'
      end
    end
    #Function Ends



    def deletecategory

        @deletecategory = Category.deletecategory(params)

        if @deletecategory == 1

            render plain: @deletecategory.inspect

        end

    end
    #Function Ends

    
    
    def projectmanagement
        
                
    end
    #Function Ends    
    
    
    def addproject
        
                
    end
    #Function Ends
    
    
    def paymentmethod
        
                
    end
    #Function Ends    
    
    
    def globalsitesetting
        
                
    end
    #Function Ends
    
    
    def contentmanagement
        
                
    end
    #Function Ends
    
    
    def addcontent
        
                
    end
    #Function Ends
    
    
    def emailtemplate
        
                
    end
    #Function Ends
    
    
    def addemail
        
                
    end
    #Function Ends
    
    
    def transactionsmanagement
        
                
    end
    #Function Ends
    
    
    def viewtransactions
        
                
    end
    #Function Ends
    
    
    
    def reviewmanagement
        
                
    end
    #Function Ends
    
    
    
    def accountmanagement
        
                
    end
    #Function Ends
    
    
    def reportsmanagement
        
                
    end
    #Function Ends
    
    
    
    def donationreport
        
                
    end
    #Function Ends
    
    
    
    
    
    
    
    def adminlogout
      
        session.destroy

        redirect_to :action => 'index' 
      
    end
    #Function Ends
    
    
    
    def changeuserstatus
        
      changeuserStatus = User.changeuserStatus(params)
        
        if changeuserStatus == 1
            flash[:status_inactive] = "Success, User status has been changed to Inactive"
                
        elsif changeuserStatus == 2
            flash[:status_active] = "Success, User status has been changed to Active"
        end
        
        render plain: changeuserStatus.inspect    
        
    end
    #Function Ends
    
    
    def changecatstatus
        
       changeCategorystatus = Category.changeCategorystatus(params)
    
       
        
        if changeCategorystatus == 1
            flash[:status_inactive] = "Success, Category status has been changed to Inactive"
                
        elsif changeCategorystatus == 2
            flash[:status_active] = "Success, Category status has been changed to Active"
        end
        
        
       render plain: changeCategorystatus.inspect         
        
    end
    #Function Ends    

    
end
