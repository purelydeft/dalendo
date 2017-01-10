class UserMailer < ApplicationMailer
    
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(first,email,linkforVerfication)
        
  	    @linkforVerfication = linkforVerfication
        @firstname          = first
        @email              = email
        mail( :to => @email,
            :subject => 'Thanks for signing up with dalendo' )
    end
    
end
