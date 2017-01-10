class ProjectController < ApplicationController
    
  def index	  
  end

  #Function for Creating Project    
  def create_project
     
    @projecttype               = Projecttype.projects
    @languages                 = Language.all
    @currency                  = Currency.all
    @getallcategories          = Category.getallcategories()
    @allcountriesAndNationalty = Country.all      
      
      
  end
  #Function Ends
    
  #Function for Saving Project   
  def save_project
    
    if params[:projecttype].present?

      savingfinalproject_basicsection = Project.savingproject(params) #Basic Section

      if savingfinalproject_basicsection != ''

        savingfinalproject_files        = ProjectFile.savingfiles(params,savingfinalproject_basicsection) #Project Files  
        
        if savingfinalproject_files != ''    

          savingfinalproject_storysection = ProjectStory.savingstory(params,savingfinalproject_basicsection) #Adding Story Section

          if savingfinalproject_storysection != ''
        
            savingfinalprojectvideo_files        = ProjectFile.savingVideofiles(params,savingfinalproject_basicsection) #Project Files
            if savingfinalprojectvideo_files != '' 
                
              savingfinalproject_aboutyousection = ProjectUser.savingaboutyou(params,savingfinalproject_storysection) #About You

              if savingfinalproject_aboutyousection != ''

                savingfinalproject_rewardssection = ProjectReward.saveRewards(params,savingfinalproject_aboutyousection) #Rewards

                if savingfinalproject_rewardssection != ''

                  savingfinalproject_accountsection = ProjectAccount.saveaccount(params,savingfinalproject_rewardssection) # Account

                  redirect_to projects_my_projects_path
                end
              end
            end
          end
        end
      end
    end
  end      
  #Function Ends
    
    
    
  def my_project
      
    if session[:current_user_id].present?
    
      userid = session[:current_user_id]  
         
      @user_all_Projects = Project.get_user_allProjects(userid) #Getting User All Projects  
    
    else
      
      redirect_to root_path
         
    end
      
  end
  
    

	
  def events	  
  end
	
	
  def logged_comments	  
  end
    
  def dummy
  end
    
    
    
    
    
  def searchprojects_OLD
        
    #      render plain: params.inspect
      
        
    if params['tags'] == nil && params['project_type'] != nil #Project_type Main

      #        render plain: params.inspect

      project_type = params['project_type']

      global_function()       

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where(:project_type => params['project_type'])

    end
           
            
    if params['tags'] != nil && params['project_type'] != nil #Project_type & Tags Main

      #      render plain: params.inspect

      category_id = params['tags']
      project_type = params['project_type']

      global_function()          

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where("project_type = ? AND category_id = ?", project_type, category_id)

    end
            
            
    if params['tags'] == nil && params['cat_id'] != nil  #Category Main

      #render plain: params.inspect

      category_id = params['cat_id']

      global_function() 

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where(:category_id => category_id) 

    end
            
        
    if params['tags'] != nil && params['cat_id'] != nil #Category & Tags Main

      #render plain: params.inspect

      category_id = params['tags']

      global_function()

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where(:category_id => category_id) 

    end
            
            
    if params['lang'] != nil && params['cat_id'] != nil #Category & Lang

      #render plain: params.inspect

      lang         = params['lang']
      category_id  = params['cat_id']

      global_function()

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where("category_id = ? AND projectlanguage = ?", category_id, lang)

    end
        
        
    if params['lang'] != nil && params['cat_id'] != nil && params['project_type'] != nil #Category, Lang & Type

      #render plain: params.inspect

      lang            = params['lang']
      category_id     = params['cat_id']
      project_type    = params['project_type']

      global_function()

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where("category_id = ? AND projectlanguage = ? AND project_type = ?", category_id, lang, project_type)

    end
        
    #---------- Function For Country ---------------  
    if params['lang'] != nil && params['cat_id'] != nil && params['project_type'] != nil && params['country'] != nil #Category,Lang,Type & Cntry 

      #render plain: params.inspect

      lang            = params['lang']
      category_id     = params['cat_id']
      project_type    = params['project_type']
      country         = params['country']

      global_function()

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where("category_id = ? AND projectlanguage = ? AND project_type = ?", category_id, lang, project_type)

    end
        
      
    if params['lang'] != nil && params['tags'] != nil && params['project_type'] != nil #project_type,Tags,& Lang
            
      #        render plain: params.inspect

      category_id     = params['tags']
      lang            = params['lang']
      project_type    = params['project_type']

      global_function()

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where("category_id = ? AND projectlanguage = ? AND project_type = ?", category_id, lang, project_type)
            
    end
      
      
    if params['lang'] != nil && params['tags'] != nil && params['project_type'] != nil #project_type,Tags,& Lang
            
      #        render plain: params.inspect

      category_id     = params['tags']
      lang            = params['lang']
      project_type    = params['project_type']

      global_function()

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where("category_id = ? AND projectlanguage = ? AND project_type = ?", category_id, lang, project_type)
            
    end
            
        
    if params['lang'] != nil && params['project_type'] != nil 

      #render plain: params.inspect

      lang         = params['lang']
      project_type = params['project_type']

      global_function()

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where("project_type = ? AND projectlanguage = ?", project_type, lang)

    end
            
    #--------- Function For Search Box -------------

    if params['search'] != nil

      name = params['search']['name']

      global_function()

      @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where('project_type LIKE ? ', "%#{name}%")

    end
      
      
        
  end
  #Function Ends
    
    
    
  def projectdetails
        
    @base_url = request.base_url
    if params['pid'] != nil
            
    @getUsersData                      = User.all
    @getCategoryData                   = Category.all
    @Get_Project_Story_data            = ProjectStory.projectbeingeditedstorydata(params)
    @Get_Project_By_Project_id         = Project.projectbeingeditedbasicdata(params)
    @projectBeingEditedRewardData      = ProjectReward.projectbeingeditedrewarddata(params)
    @project_supporters                = ProjectSupporter.getProjectsupporters(params)
    @particular_projectFollow_stat     = ProjectFollower.particular_projectFollow_stat(params,session[:current_user_id])
    @particular_projectSupporter_stat  = ProjectSupporter.particular_projectSupporter_stat(params,session[:current_user_id])
               
    end
        
        
  end
  #Function Ends
    
    
    
  def news	
      
    if params['pid'] != nil
            
    @getUsersData                   = User.all
    @getCategoryData                = Category.all
    @Get_Project_Story_data         = ProjectStory.projectbeingeditedstorydata(params)
    @Get_Project_By_Project_id      = Project.projectbeingeditedbasicdata(params)
    @projectBeingEditedRewardData   = ProjectReward.projectbeingeditedrewarddata(params)
    @project_supporters             = ProjectSupporter.getProjectsupporters(params)
    @particular_projectFollow_stat  = ProjectFollower.particular_projectFollow_stat(params,session[:current_user_id])
    @particular_projectSupporter_stat  = ProjectSupporter.particular_projectSupporter_stat(params,session[:current_user_id])    
      #render plain: @projectBeingEditedRewardData.inspect
            
    end      
      
      
  end    
  #Function Ends  


  def addnews

    @getUsersData                   = User.all
    @getCategoryData                = Category.all
    @Get_Project_Story_data         = ProjectStory.projectbeingeditedstorydata(params)
    @Get_Project_By_Project_id      = Project.projectbeingeditedbasicdata(params)
    @projectBeingEditedRewardData   = ProjectReward.projectbeingeditedrewarddata(params)
    @project_supporters             = ProjectSupporter.getProjectsupporters(params)
    @particular_projectFollow_stat  = ProjectFollower.particular_projectFollow_stat(params,session[:current_user_id])
    @particular_projectSupporter_stat  = ProjectSupporter.particular_projectSupporter_stat(params,session[:current_user_id])  

  end
    
    
  def comments	  

    if params['pid'] != nil
            
    #@getUsersData                  = User.all
    @loggedIn_UserData              = User.where(id: session[:current_user_id]).all
    @getCategoryData                = Category.all
    @Get_Project_Story_data         = ProjectStory.projectbeingeditedstorydata(params)
    @Get_Project_By_Project_id      = Project.projectbeingeditedbasicdata(params)
    @projectBeingEditedRewardData   = ProjectReward.projectbeingeditedrewarddata(params)
    @project_supporters             = ProjectSupporter.getProjectsupporters(params)
    @getProjectComments             = ProjectComment.getProjectComments(params) #Getting Comments
    @particular_projectFollow_stat  = ProjectFollower.particular_projectFollow_stat(params,session[:current_user_id])
    @particular_projectSupporter_stat  = ProjectSupporter.particular_projectSupporter_stat(params,session[:current_user_id])    
            
            
            
    end         
      
  end    
    
  
  def savecomments
      
    @Saving_Comments        = ProjectComment.new(project_id: params[:project_id] ,commented_by: params[:commented_by], comment: params[:comment], status: '0')
      
    if @Saving_Comments.save
              
      redirect_to(:back)  
               
    end       
      
  end
  #Function Ends       
    
    
  def dalenders
 
    if params['pid'] != nil
            
    #@getUsersData                  = User.all
    @loggedIn_UserData              = User.where(id: session[:current_user_id]).all
    @getCategoryData                = Category.all
    @Get_Project_Story_data         = ProjectStory.projectbeingeditedstorydata(params)
    @Get_Project_By_Project_id      = Project.projectbeingeditedbasicdata(params)
    @projectBeingEditedRewardData   = ProjectReward.projectbeingeditedrewarddata(params)
    @project_supporters             = ProjectSupporter.getProjectsupporters(params)
    @getProjectComments             = ProjectComment.getProjectComments(params) #Getting Comments
    @particular_projectFollow_stat  = ProjectFollower.particular_projectFollow_stat(params,session[:current_user_id])
    @particular_projectSupporter_stat  = ProjectSupporter.particular_projectSupporter_stat(params,session[:current_user_id])    
            
            
            
    end       
      
  end    
  #Function Ends 
  
  def choose_your_reward
    
    session[:my_previous_url] = URI(request.referer || '').path
    @back_url = session[:my_previous_url]
    
    if params['pid'] != nil
      
      @getRewardsAcctoProject = ProjectReward.projectbeingeditedrewarddata(params)   
      #render plain: @getRewardsAcctoProject.inspect
    end
    
  end
  #Function Ends
  
  
  def choose_payment
    
    
    if params[:rewardstatus] == '0'                   
      #render plain: params.inspect       
    else
      @return = '786'
      #render plain: @return.inspect
    end
  end
  #Function Ends
  
  
  def follow_project
    
    if params[:projectid].present?
           
      @follow_unfollow_project = ProjectFollower.follow_unfollow_project(params)
           
      render plain: @follow_unfollow_project.inspect
      
    end
    
  end
  #Function Ends
  
  def support_unsupport_project
    
    if params[:projectid].present?
           
      @support_unsupport_project = ProjectSupporter.support_unsupport_project(params)
           
      render plain: @support_unsupport_project.inspect
      
    end
    
  end
  #Function Ends
  
  
  
  
  
  def searchprojects
    
#    render plain: params.inspect

    cat_id        = params['cat_id']
    lang          = params['lang']
    project_type  = params['project_type']
    #country       = params['country']
    tags          = params['tags']
    filter        = params['filter']
    sortby        = params['sortby']
    q             = params['q']
    
#    render plain: q.inspect
    
    global_function()
    
    arr = Array.new
    
    test = 0
    if project_type != nil
      arr = {'project_type' => project_type}
      test = 1
    end
    
    if cat_id != nil
      if test == 1
        arr[:category_id]= cat_id
      else
        arr = {'category_id' => cat_id}
        test = 1
      end
    end
    
    if lang != nil
      if test == 1
        arr[:projectlanguage]= lang
      else
        arr = {'projectlanguage' => lang}
        test = 1
      end
    end
    
#    if country != nil
#      if test == 1
#        arr[:country]= country
#      else
#        arr = {'country' => country}
#        test = 1
#      end
#    end
    
    if tags != nil
      if test == 1
        arr[:category_id]= tags
      else
        arr = {'category_id' => tags}
        test = 1
      end
    end
    
    #render plain: arr.inspect
    
    @Get_Projects_By_Cat_id = Project.paginate(:page => params[:page], :per_page => 4).where(arr)
    
    #render plain: @Get_Projects_By_Cat_id.inspect   
    
  end
  #Function Ends
    
  def image

    if params['test_image'].present?      
      @saveimage = Project.saveimage(params)
      render plain: @saveimage.inspect
    end    
  end
  
  
  
  private

  def global_function
      
    @getUsersData               = User.all
    @getCategoryData            = Category.all
    @projecttype                = Projecttype.projects
    @languages                  = Language.all
    @allcountries               = Country.all
    @allprojects                = Project.all

      
  end
  #Function Ends
  
  
  

    
  
end