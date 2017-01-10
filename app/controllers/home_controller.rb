class HomeController < ApplicationController
    
    ##############
    
    skip_before_action :verify_authenticity_token
    before_filter :set_cache_buster
    require 'securerandom'
    
    def set_cache_buster
        response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
    
    ###############
    
    
    
    #------------------- Twitter Login ----------------------#
    
    
    def create
        
        render plain: request.env['omniauth.auth'].to_yaml
        
          begin
              
        @user = User.from_omniauth(request.env['omniauth.auth'])
              
        session[:user_id] = @user.id
              
        flash[:success] = "Welcome, #{@user.name}!"
              
          rescue
              
        flash[:warning] = "There was an error while trying to authenticate you..."
              
          end
    
        redirect_to root_path
        
        
        
        
        private

        def current_user
            @current_user ||= User.find_by(id: session[:user_id])
        end

        helper_method :current_user
        
        
    end
    
    
    
    
    
    
    def destroy
        
        if current_user
            session.delete(:user_id)
            flash[:success] = 'See you!'
        end
        
        redirect_to root_path
    end
    
    
    
    
    #------------------- Twitter Login ----------------------#
    
    
    def index
        
        @getallcategories            = Category.getallcategories()
        @getallProjects              = Project.getallprojects()
        @getUsersData                = User.all
         
        #render plain: @getallProjects.inspect
        
      
      if params['project_id'] != nil
        
        @like_unlike_working = ProjectLike.like_unlike_working(params)
        
        render plain: @like_unlike_working.inspect 
      end
        
    end
    #Function End
    
    
    

    def signup
        
    if params[:signup].present? # Start Main if for Signup

    # Check if email and username already existed, then display error, otherwise save userdata.

    @find_user_by_username_email = User.find_by(email: params[:signup]['useremail'], user_name: params[:signup][:username])

    if @find_user_by_username_email.present? # Start if for find_user_by_email

        redirect_to signup_path, flash: {alert: "Sorry..! This email or username is already existed. Please try with a different email and username."}

    else


        randomcode = SecureRandom.hex # RegisterCode Generates From Here
        currentUrl = request.original_url
        linkforVerfication = "#{currentUrl}"+'/active?'+'redirect=y&c='+"#{randomcode}"
        register_ip = request.remote_ip


        name = params[:signup][:name]

        arr = name.split(' ')

        first = arr[0]
        last = arr[1]


        user_name           = params[:signup][:username]
        email               = params[:signup][:useremail]
        encrypted_password  = Digest::MD5.hexdigest(params[:signup][:userpassword])



        @mailstatus = UserMailer.send_signup_email(first,email,linkforVerfication).deliver_now

        if @mailstatus != nil   # Start if for @mailstatus

            #render plain: @mailstatus.inspect


            @SaveUser = User.new(first_name: first, last_name: last, user_name: user_name, email: email, password: encrypted_password, register_ip: register_ip, registercode: randomcode, user_role: 'user', user_status: 'inactive' )


            if @SaveUser.save # Start if for SaveUser

#                        lastid          = User.maximum(:id) # Get Last Record Inserted Id 
#                        @lastRecordData = User.where(id: lastid) # Get Last Record Inserted Full Details
#
#                        session[:current_user_id]           = @lastRecordData[0]['id']
#                        session[:current_user_first_name]   = @lastRecordData[0]['first_name']
#                        session[:current_user_last_name]    = @lastRecordData[0]['last_name']  
#                        session[:current_user_email]        = @lastRecordData[0]['email']
                
                
                redirect_to user_signin_path, flash: {success: "Congratulations..! You have registered with Dalendo successfuly. we have sent an email verification link to your registered email, click on that link to verify your email."}

            end # End if for SaveUser

        else

            redirect_to user_signup_path, flash: {mail_error: "Some problem has been occured while sending email, Please try again."}

        end # End if for @mailstatus


    end  # End if for find_user_by_email

   
   elsif params[:ajaxparams].present?  #Elsif for signup while submitting project 
        
    @find_user_by_username_email = User.find_by(email: params['useremail'], user_name: params[:username])

    if @find_user_by_username_email.present? # Start if for find_user_by_email

      @return = "Email existed"
      render plain: @return.inspect    
    else
        
        randomcode = SecureRandom.hex # RegisterCode Generates From Here
        currentUrl = request.original_url
        linkforVerfication = "#{currentUrl}"+'/active?'+'redirect=y&c='+"#{randomcode}"
        register_ip = request.remote_ip


        name = params[:name]

        arr = name.split(' ')

        first = arr[0]
        last = arr[1]


        user_name           = params[:username]
        email               = params[:useremail]
        encrypted_password  = Digest::MD5.hexdigest(params[:password])



        @mailstatus = UserMailer.send_signup_email(first,email,linkforVerfication).deliver_now

        if @mailstatus != nil   # Start if for @mailstatus

            #render plain: @mailstatus.inspect


            @SaveUser = User.new(first_name: first, last_name: last, user_name: user_name, email: email, password: encrypted_password, register_ip: register_ip, registercode: randomcode, user_role: 'user', user_status: 'inactive' )


            if @SaveUser.save # Start if for SaveUser

                         lastid          = User.maximum(:id) # Get Last Record Inserted Id 
#                        @lastRecordData = User.where(id: lastid) # Get Last Record Inserted Full Details
#
#                        session[:current_user_id]           = @lastRecordData[0]['id']
#                        session[:current_user_first_name]   = @lastRecordData[0]['first_name']
#                        session[:current_user_last_name]    = @lastRecordData[0]['last_name']  
#                        session[:current_user_email]        = @lastRecordData[0]['email']

                 render plain: lastid.inspect

            end # End if for SaveUser

        else

              @return = "mailnotSent"
              render plain: @return.inspect

        end # End if for @mailstatus


    end  # End if for find_user_by_email

   end # End Main -If

end

    #Function End
    
    
    
    


    def emailverified
        
        getrandomcode = params[:c]

        @useremailverficationFunction = User.emailverification(getrandomcode) 
        

            if @useremailverficationFunction[0]['user_status'] == 'active'

                session[:current_user_id]           = @useremailverficationFunction[0]['id']
                session[:current_user_first_name]   = @useremailverficationFunction[0]['first_name']
                session[:current_user_last_name]    = @useremailverficationFunction[0]['last_name']    
                session[:current_user_email]        = @useremailverficationFunction[0]['email']
                session[:current_user_image]        = @useremailverficationFunction[0]['user_image']

                redirect_to root_path

            end

    end

    #Function Ends
    
    
    
    
    def signin
        #render plain: params.inspect
        if params[:signin].present? # Start Main if for Signin
            
            # Check if username & password are correct, then login
            
            encrypted_password  = Digest::MD5.hexdigest(params[:signin][:userpassword])
            
            @find_user_by_username = User.find_by(user_name: params[:signin][:username], password: encrypted_password, user_role: 'user')
            
            if @find_user_by_username.present?  # Start Main if for find_user_by_username
                
                login_ip = request.remote_ip
                User.where(:id => @find_user_by_username.id).update_all(last_login_ip: login_ip)

                session[:current_user_id] 			= @find_user_by_username.id
                session[:current_user_first_name] 	= @find_user_by_username.first_name
                session[:current_user_last_name] 	= @find_user_by_username.last_name
                session[:current_user_email] 		= @find_user_by_username.email
                session[:current_user_image]        = @find_user_by_username.user_image
                
                
                
                if params[:signin]['remember_me'] == '1'    # Start Remember me working
                    
                    cookies[:userid]        = @find_user_by_username.id
                    cookies[:username]      = { value: params[:signin]['username'], expires: 2.weeks.from_now }
                    cookies[:userpassword]  = { value: params[:signin]['userpassword'], expires: 2.weeks.from_now }
                    
                end # End Remember me working
                
                
                if params[:projectid].present?
                
                 @url = "/#{params[:projectname]}/#{params[:projectid]}"   
                   
                 redirect_to @url 
                    
                else
                    
                 redirect_to root_path
                    
                end    
                         
            else
                
               # redirect_to root_path, flash: {error: "Oops, something went wrong. Please try again..!"}
                
            end # End Main if for find_user_by_username
            
            
        elsif params[:ajaxparams].present? #Project Sign-In
                     
                
               encrypted_password  = Digest::MD5.hexdigest(params[:password])
            
               @find_user_by_username = User.find_by(user_name: params[:username], password: encrypted_password) 
            
               if @find_user_by_username.present?  # Start Main if for find_user_by_username
                
                login_ip = request.remote_ip
                User.where(:id => @find_user_by_username.id).update_all(last_login_ip: login_ip)

                session[:current_user_id] 			= @find_user_by_username.id
                session[:current_user_first_name] 	= @find_user_by_username.first_name
                session[:current_user_last_name] 	= @find_user_by_username.last_name
                session[:current_user_email] 		= @find_user_by_username.email
                session[:current_user_image]        = @find_user_by_username.user_image
            
                loggedinUserId = @find_user_by_username.id
                render plain: loggedinUserId.inspect
                         
                else
                
                @returngiver = 'wrongCredenionls'
                render plain: @returngiver.inspect    
                
                end # End Main if for find_user_by_username            
            
        end # End Main if for Signin
  	
    end
    #Function End
    
    
    
        
    def facebook_signup

        @checkingEmailregisterd = User.where(email: params[:email])

        if @checkingEmailregisterd.count > 0
                        
            login_ip = request.remote_ip
            User.where(:id => @checkingEmailregisterd[0]['id']).update_all(last_login_ip: login_ip)

            session[:current_user_id]           = @checkingEmailregisterd[0]['id']
            session[:current_user_first_name]   = @checkingEmailregisterd[0]['first_name']
            session[:current_user_last_name]    = @checkingEmailregisterd[0]['last_name'] 
            session[:current_user_email]        = @checkingEmailregisterd[0]['email']


            @returngiver = 2
            render plain: @returngiver.inspect

        else
            
            register_ip = request.remote_ip

            @savingUserInfo = User.new(:first_name => params[:firstname], :last_name => params[:lastname], :email => params[:email], :user_status => 'active', :user_role => 'user', :register_ip => register_ip, :facebook_id => params[:facebook_id])

                if @savingUserInfo.save

                    lastid = User.maximum(:id) #Get Last Record Inserted Id 
                    @lastRecordData = User.where(id: lastid) #Get Last Record Inserted Full Details
                    
                    session[:current_user_id]           = @lastRecordData[0]['id']
                    session[:current_user_first_name]   = @lastRecordData[0]['first_name']
                    session[:current_user_last_name]    = @lastRecordData[0]['last_name']
                    session[:current_user_email]        = @lastRecordData[0]['email']

                    @returngiver = 1
                    render plain: @returngiver.inspect

                end #savingUserInfo If ends
            
        end #checkingEmailregisterd If/Else Ends

    end 

    #Function Ends    
    
    
    
    def facebook_signup_project

        @checkingEmailregisterd = User.where(email: params[:email])

        if @checkingEmailregisterd.count > 0
                        
            login_ip = request.remote_ip
            User.where(:id => @checkingEmailregisterd[0]['id']).update_all(last_login_ip: login_ip)

            session[:current_user_id]           = @checkingEmailregisterd[0]['id']
            session[:current_user_first_name]   = @checkingEmailregisterd[0]['first_name']
            session[:current_user_last_name]    = @checkingEmailregisterd[0]['last_name'] 
            session[:current_user_email]        = @checkingEmailregisterd[0]['email']


            @returngiver = @checkingEmailregisterd[0]['id']
            render plain: @returngiver.inspect

        else
            
            register_ip = request.remote_ip

            @savingUserInfo = User.new(:first_name => params[:firstname], :last_name => params[:lastname], :email => params[:email], :user_status => 'active', :user_role => 'user', :register_ip => register_ip, :facebook_id => params[:facebook_id])

                if @savingUserInfo.save

                    lastid = User.maximum(:id) #Get Last Record Inserted Id 
                    @lastRecordData = User.where(id: lastid) #Get Last Record Inserted Full Details
                    
                    session[:current_user_id]           = @lastRecordData[0]['id']
                    session[:current_user_first_name]   = @lastRecordData[0]['first_name']
                    session[:current_user_last_name]    = @lastRecordData[0]['last_name']
                    session[:current_user_email]        = @lastRecordData[0]['email']

                    @returngiver = lastid
                    render plain: @returngiver.inspect

                end #savingUserInfo If ends
            
        end #checkingEmailregisterd If/Else Ends

    end 

    #Function Ends
    
    
    
    
    def google_signup

        @checkingEmailregisterd = User.where(email: params[:email])
        
        

        if @checkingEmailregisterd.count > 0
            
            login_ip = request.remote_ip
            User.where(:id => @checkingEmailregisterd[0]['id']).update_all(last_login_ip: login_ip)

            session[:current_user_id]           = @checkingEmailregisterd[0]['id']
            session[:current_user_first_name]   = @checkingEmailregisterd[0]['first_name']
            session[:current_user_last_name]    = @checkingEmailregisterd[0]['last_name'] 
            session[:current_user_email]        = @checkingEmailregisterd[0]['email']


            @returngiver = 2
            render plain: @returngiver.inspect

        else
            
            register_ip = request.remote_ip
            

            @savingUserInfo = User.new(:first_name => params[:firstname], :last_name => params[:lastname], :email => params[:email], :user_status => 'active', :user_role => 'user', :register_ip => register_ip, :google_id => params[:google_id])

                if @savingUserInfo.save

                    lastid = User.maximum(:id) #Get Last Record Inserted Id 
                    @lastRecordData = User.where(id: lastid) #Get Last Record Inserted Full Details
                    
                    session[:current_user_id]           = @lastRecordData[0]['id']
                    session[:current_user_first_name]   = @lastRecordData[0]['first_name']
                    session[:current_user_last_name]    = @lastRecordData[0]['last_name']
                    session[:current_user_email]        = @lastRecordData[0]['email']

                    @returngiver = 1
                    render plain: @returngiver.inspect

                end #savingUserInfo If ends
            
        end #checkingEmailregisterd If/Else Ends

    end 

    #Function Ends
    
    
    
        def google_signup_project

        @checkingEmailregisterd = User.where(email: params[:email])
        
        

        if @checkingEmailregisterd.count > 0
            
            login_ip = request.remote_ip
            User.where(:id => @checkingEmailregisterd[0]['id']).update_all(last_login_ip: login_ip)

            session[:current_user_id]           = @checkingEmailregisterd[0]['id']
            session[:current_user_first_name]   = @checkingEmailregisterd[0]['first_name']
            session[:current_user_last_name]    = @checkingEmailregisterd[0]['last_name'] 
            session[:current_user_email]        = @checkingEmailregisterd[0]['email']


            @returngiver = @checkingEmailregisterd[0]['id']
            render plain: @returngiver.inspect

        else
            
            register_ip = request.remote_ip
            

            @savingUserInfo = User.new(:first_name => params[:firstname], :last_name => params[:lastname], :email => params[:email], :user_status => 'active', :user_role => 'user', :register_ip => register_ip, :google_id => params[:google_id])

                if @savingUserInfo.save

                    lastid = User.maximum(:id) #Get Last Record Inserted Id 
                    @lastRecordData = User.where(id: lastid) #Get Last Record Inserted Full Details
                    
                    session[:current_user_id]           = @lastRecordData[0]['id']
                    session[:current_user_first_name]   = @lastRecordData[0]['first_name']
                    session[:current_user_last_name]    = @lastRecordData[0]['last_name']
                    session[:current_user_email]        = @lastRecordData[0]['email']

                    @returngiver = lastid
                    render plain: @returngiver.inspect

                end #savingUserInfo If ends
            
        end #checkingEmailregisterd If/Else Ends

    end 

    #Function Ends
    
    
    
    
    def linkedin_signup

        @checkingEmailregisterd = User.where(email: params[:email])

        if @checkingEmailregisterd.count > 0
            
            login_ip = request.remote_ip
            User.where(:id => @checkingEmailregisterd[0]['id']).update_all(last_login_ip: login_ip)

            session[:current_user_id]           = @checkingEmailregisterd[0]['id']
            session[:current_user_first_name]   = @checkingEmailregisterd[0]['first_name']
            session[:current_user_last_name]    = @checkingEmailregisterd[0]['last_name'] 
            session[:current_user_email]        = @checkingEmailregisterd[0]['email']


            @returngiver = 2
            render plain: @returngiver.inspect

        else
            
            register_ip = request.remote_ip
            

            @savingUserInfo = User.new(:first_name => params[:firstname], :last_name => params[:lastname], :email => params[:email], :user_status => 'active', :user_role => 'user', :register_ip => register_ip, :linkedin_id => params[:linkedin_id])

                if @savingUserInfo.save

                    lastid = User.maximum(:id) #Get Last Record Inserted Id 
                    @lastRecordData = User.where(id: lastid) #Get Last Record Inserted Full Details
                    
                    session[:current_user_id]           = @lastRecordData[0]['id']
                    session[:current_user_first_name]   = @lastRecordData[0]['first_name']
                    session[:current_user_last_name]    = @lastRecordData[0]['last_name']
                    session[:current_user_email]        = @lastRecordData[0]['email']

                    @returngiver = 1
                    render plain: @returngiver.inspect

                end #savingUserInfo If ends
            
        end #checkingEmailregisterd If/Else Ends

    end 

    #Function Ends    
    
    
    
    def linkedin_signup_project

        @checkingEmailregisterd = User.where(email: params[:email])

        if @checkingEmailregisterd.count > 0
            
            login_ip = request.remote_ip
            User.where(:id => @checkingEmailregisterd[0]['id']).update_all(last_login_ip: login_ip)

            session[:current_user_id]           = @checkingEmailregisterd[0]['id']
            session[:current_user_first_name]   = @checkingEmailregisterd[0]['first_name']
            session[:current_user_last_name]    = @checkingEmailregisterd[0]['last_name'] 
            session[:current_user_email]        = @checkingEmailregisterd[0]['email']


            @returngiver = @checkingEmailregisterd[0]['id']
            render plain: @returngiver.inspect

        else
            
            register_ip = request.remote_ip
            

            @savingUserInfo = User.new(:first_name => params[:firstame], :last_name => params[:lastname], :email => params[:email], :user_status => 'active', :user_role => 'user', :register_ip => register_ip, :linkedin_id => params[:linkedin_id])

                if @savingUserInfo.save

                    lastid = User.maximum(:id) #Get Last Record Inserted Id 
                    @lastRecordData = User.where(id: lastid) #Get Last Record Inserted Full Details
                    
                    session[:current_user_id]           = @lastRecordData[0]['id']
                    session[:current_user_first_name]   = @lastRecordData[0]['first_name']
                    session[:current_user_last_name]    = @lastRecordData[0]['last_name']
                    session[:current_user_email]        = @lastRecordData[0]['email']

                    @returngiver = lastid
                    render plain: @returngiver.inspect

                end #savingUserInfo If ends
            
        end #checkingEmailregisterd If/Else Ends

    end 

    #Function Ends
    
    


    def search
        
        
  	
    end
    #Function End


  
  
    def slider
      
        render layout: 'slider'

    end
    #Function End
    
    
    
    
    def faq
  	
    end
    #Function End
    
    
    
    def signout

        session.destroy

        redirect_to :action => 'index' 
      
    end
    #Function Ends
    
    
    
    

    
    
    
end
