Rails.application.routes.draw do
  
#    get '/auth/:provider/callback' => 'home#create'
    get '/auth/:provider/callback', to: 'home#create'
    delete '/logout', to: 'home#destroy'
    
#    get '/auth/:provider' => 'home#create'

####### Backend Routes Starts
    
    get     '/backend/dalendo-admin'                => 'backend#index'
    post    '/backend/adminlogin'                   => 'backend#adminlogin'
    get     '/backend/adminlogout'                  => 'backend#adminlogout'
    get     '/backend/dashboard'                    => 'backend#dashboard', as: 'dashboard'
    
    ######## Routes for backend/user-management
    
    get  '/backend/user-management',                to: 'backend#usermanagement'
    post '/backend/user-management',                to: 'backend#usermanagement'
    get  '/backend/add-user',                       to: 'backend#adduser'
    post '/backend/user-add',                       to: 'backend#useradd'
    get  '/backend/view-user',                      to: 'backend#viewsingleuser'
    get  '/backend/edit-user',                      to: 'backend#edituser'
    post '/backend/update-user',                    to: 'backend#updateuser'
    get  '/backend/changeUserstatus',               to: 'backend#changeUserstatus'
    post '/backend/changeUserstatus',               to: 'backend#changeUserstatus'
    post '/backend/deleteUser',                     to: 'backend#deleteUser'
    post '/backend/changeuser-status',              to: 'backend#changeuserstatus'
    

    
    # Routes for backend/category-management
    get  '/backend/category-management',            to: 'backend#categorymanagement'
    post '/backend/category-management',            to: 'backend#categorymanagement'
    get  '/backend/add-category',                   to: 'backend#addcategory'
    post '/backend/add-category',                   to: 'backend#addcategory'
    get  '/backend/view-category',                  to: 'backend#viewcategory'
    get  '/backend/edit-category',                  to: 'backend#editcategory'
    post '/backend/edit-category',                  to: 'backend#editcategory'
    post '/backend/category-update',                to: 'backend#categoryupdate'
    post '/backend/change-category-status',         to: 'backend#changecatstatus'
    post '/backend/delete-category',                to: 'backend#deletecategory'

    

    

    scope module: 'backend' do

    # Routes for backend/badges-management

    get  '/backend/badges-management',                to: 'badges#badgesmanagement'
    get  '/backend/add-badges',                       to: 'badges#addbadges'   
    post '/backend/add-badges',                       to: 'badges#addbadges'
    get  '/backend/view-badges',                      to: 'badges#viewbadges'
    get  '/backend/edit-badges',                      to: 'badges#editbadges'   
    post '/backend/edit-badges',                      to: 'badges#editbadges'
    get  '/backend/delete-badges',                    to: 'badges#deletebadges'
    post '/backend/delete-badges',                    to: 'badges#deletebadges'
    post '/backend/change-badge-status',              to: 'badges#changebadgestatus'

    # Routes for backend/project-management

    get  '/backend/project-management',              to: 'backendproject#projectmanagement'
    get  '/backend/add-project',                     to: 'backendproject#addproject'
    post '/backend/add-project',                     to: 'backendproject#addproject'
    get  '/backend/add-reward',                      to: 'backendproject#addrewards'
    get  '/backend/edit-project',                    to: 'backendproject#editproject'
    post '/backend/edit-project',                    to: 'backendproject#editproject'
    post '/backend/saveedit-project',                to: 'backendproject#saveeditproject'
    post '/backend/changeproject-status',            to: 'backendproject#changeProjectstatus'
    post '/backend/delete-files',                    to: 'backendproject#deletefiles'

    end
    
    
    # Routes for backend/Payment-method
    
    get  '/backend/payment-method',                  to: 'backend#paymentmethod'
    post '/backend/payment-method',                  to: 'backend#paymentmethod'
    
    
    
    # Routes for backend/Global-Site-method
    
    get  '/backend/global-site-setting',             to: 'backend#globalsitesetting'
    #post '/backend/payment-method',                  to: 'backend#paymentmethod'
    
    
    # Routes for backend/Content-Management
    
    get  '/backend/content-management',              to: 'backend#contentmanagement'
    post '/backend/content-management',              to: 'backend#contentmanagement'
    get  '/backend/add-content',                     to: 'backend#addcontent'
    post '/backend/add-content',                     to: 'backend#addcontent'
    
    
    
    # Routes for backend/Email-Template
    
    get  '/backend/email-template',                  to: 'backend#emailtemplate'
    post '/backend/email-template',                  to: 'backend#emailtemplate'
    get  '/backend/add-email',                       to: 'backend#addemail'
    post '/backend/add-email',                       to: 'backend#addemail'
    
    
    
    # Routes for backend/transactions-management
    
    get  '/backend/transactions-management',          to: 'backend#transactionsmanagement'
    post '/backend/transactions-management',          to: 'backend#transactionsmanagement'
    get  '/backend/view-transactions',                to: 'backend#viewtransactions'
    
    
    
    # Routes for backend/review-management
    
    get  '/backend/review-management',               to: 'backend#reviewmanagement'
    post '/backend/review-management',               to: 'backend#reviewmanagement'
    
    
    
    # Routes for backend/account-management
    
    get  '/backend/account-management',               to: 'backend#accountmanagement'
    post '/backend/account-management',               to: 'backend#accountmanagement'
    
    
    
    # Routes for backend/reports-management
    
    get  '/backend/reports-management',               to: 'backend#reportsmanagement'
    post '/backend/reports-management',               to: 'backend#reportsmanagement'
    get  '/backend/donation-report',                  to: 'backend#donationreport'
    
    
    
    
     
####### Backend Routes Ends
    
    
    
    
    
    
    
    
####### Start Frontend Routes

    root :controller => 'home', :action => 'index'
  
    get     '/'     => 'home#index'
    get     '/home' => 'home#index'
    post    '/home' => 'home#index'
  

    # Routes for Frontend/User Signup
    
    get 	'/user/signup'         => 'home#signup'
    post 	'/user/signup'         => 'home#signup'  
    
    get     'user/signup/active'       => 'home#emailverified'
    
    post 	'/user/facebook_signup' => 'home#facebook_signup'
    post 	'/user/facebook_signup_project' => 'home#facebook_signup_project'
    post 	'/user/google_signup'   => 'home#google_signup'
    post 	'/user/google_signup_project'   => 'home#google_signup_project'
    post 	'/user/linkedin_signup' => 'home#linkedin_signup'
    post 	'/user/linkedin_signup_project' => 'home#linkedin_signup_project'
        
    # Routes for Frontend/User Signin
    
    get     '/user/signin' => 'home#signin'
    post    '/user/signin' => 'home#signin'
    get     '/user/signin/:projecttitle/:projectid' => 'home#signin'   
         
   
  
    # Routes for Frontend/User SignOut
    
    get    'signout' => 'home#signout'
    
    get    '/projects/signout' => 'home#signout'
    
    
    	
	#Routes For Creating-Project
	
	  get  '/projects/create' => 'project#create_project'
    post '/projects/create' => 'project#create_project'
    
    
    post '/projects/save'   => 'project#save_project'
    get  '/projects/save'   => 'project#save_project'
    
    get  '/projects/my-projects'       => 'project#my_project'
    post '/projects/my-projects'       => 'project#my_project'
    
    

    get 	'slider' => 'home#slider'
    post 	'slider' => 'home#slider'

  
  
    get 	'faq' => 'home#faq'
    post 	'faq' => 'home#faq'
  
 
  
    get 	'profile' => 'home#profile'
    post 	'profile' => 'home#profile'
  

  
    # Routes For Single Project Details
    

    
  	get  'project-detail' => 'project#index'
    post 'project-detail' => 'project#index'
                
        
    # Routes For search projects
    
    get '/search/'                               => 'project#searchprojects'
    get '/search/:project_type'                  => 'project#searchprojects'
    get '/search/:category_name/:cat_id'         => 'project#searchprojects'
    
        
   
    
    get  '/:protitle/:pid'                         => 'project#projectdetails'

    get  '/:protitle/news/:pid'                    => 'project#news'
    post '/:protitle/news/:pid'                    => 'project#news'    

    get  '/:protitle/add-news/:pid'                => 'project#addnews'
    post '/:protitle/add-news/:pid'                => 'project#addnews'    
    
    get  '/:protitle/dalenders/:pid'               => 'project#dalenders'
    post '/:protitle/dalenders/:pid'               => 'project#dalenders'

    get  '/:protitle/comments/:pid'                => 'project#comments'
    post '/:protitle/comments/:pid'                => 'project#comments'        
    post '/savecomments'                           => 'project#savecomments'
    
      
    get  '/:protitle/choose-your-reward/:pid'      => 'project#choose_your_reward'
    post '/:protitle/choose-your-reward/:pid'      => 'project#choose_your_reward'  
    
    get  '/projects/checkout/choose-payment'       => 'project#choose_payment'
    post '/projects/checkout/choose-payment'       => 'project#choose_payment'
    
    #Routes for Following Project  
    post '/projects/follow-project'                => 'project#follow_project'  
    post '/projects/support-unsupport-project'     => 'project#support_unsupport_project'  
    
      
    get  '/image' => 'project#image'
    post '/image' => 'project#image'
    

    

	 
	  get 'events' => 'project#events'
    post 'events' => 'project#events'
	
	  get 'logged_comments' => 'project#logged_comments'
    post 'logged_comments' => 'project#logged_comments'
	

	
	# create project
	get 'guidelines' => 'project#guidelines'
    post 'guidelines' => 'project#guidelines'

	
	get 'thanku' => 'project#thanku'
    post 'thanku' => 'project#thanku'
	

	
	get 'payment-confirm' => 'project#payment-confirm'
    post 'payment-confirm' => 'project#payment-confirm'
	
	get 'choose-payment' => 'project#choose-payment'
    post 'choose-payment' => 'project#choose-payment'
	
	get 'pay-credit-card' => 'project#pay-credit-card'
    post 'pay-credit-card' => 'project#pay-credit-card'

    
    # Routes for Search Project
    get     '/projects/search' => 'project#searchprojects'
    post    '/projects/search' => 'project#searchprojects'
    
    
        
    
    
	
	get 'search-page' => 'project#search-page'
    post 'search-page' => 'project#search-page'

	
####### Start Frontend Routes
	
	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
