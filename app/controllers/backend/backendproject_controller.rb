module Backend
  class BackendprojectController < ApplicationController

    skip_before_action :verify_authenticity_token
    layout 'backend'
    require 'json'


    #Making global function for render view of badges
    def self.controller_path

      "backend/backendproject"

    end


    def projectmanagement

      if session[:current_user_id] != nil

        @getUsers          = User.getusers()
        @getallProjects    = Project.getallprojects()
        @getallcategories  = Category.getallcategories()

      else

        redirect_to backend_dalendo_admin_path #redirct if session is out

      end


    end


    def addproject

      if session[:current_user_id] != nil

        # Getting Nationality Acc to country
        if params[:obj].present?
          @singlenationality       = Country.singlenationality(params)
          render plain: @singlenationality.inspect
        end
        #Ends

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

                    flash[:addproject] = "Success, Project Has been saved."
                    render plain: savingfinalproject_accountsection.inspect

                end

              end

            end

          end
       
       end
              
    end


        end

        @getallcategories          = Category.getallcategories()
        @getUsers                  = User.getusers()
        @languages                 = Language.all
        @currency                  = Currency.all
        @projecttype               = Projecttype.projects
        @allcountriesAndNationalty = Country.all



      else

        redirect_to backend_dalendo_admin_path #redirct if session is out
      end

    end



    def editproject

       @getallcategories          = Category.getallcategories()
       @projecttype               = Projecttype.projects
       @getUsers                  = User.getusers()
       @currency                  = Currency.all
       @languages                 = Language.all
       @allcountriesAndNationalty = Country.all

       if params[:pid].present?

        @projectBeingEditedData         = Project.projectbeingeditedbasicdata(params)
        @projectBeingEditedRewardData   = ProjectReward.projectbeingeditedrewarddata(params)
        @projectBeingEditedStoryData    = ProjectStory.projectbeingeditedstorydata(params)
        @projectBeingEditedAboutData    = ProjectUser.projectbeingeditedaboutyoudata(params)
        @projectBeingEditedAccountData  = ProjectAccount.projectbeingeditedaccountdata(params)
           

       end


    end
      
      
      
    def saveeditproject
        
    if params[:projecttype].present?

    editingfinalproject_basicsection = Project.savingeditproject(params) # Edit Basic Section   

    if editingfinalproject_basicsection == 1

    editingfinalproject_storysection = ProjectStory.savingeditstory(params) #Edit Story Section

    if editingfinalproject_storysection == 2

    savingfinalproject_Editaboutyousection = ProjectUser.saveeditaboutyou(params) #About You
        
    if savingfinalproject_Editaboutyousection == 3
    
    savingfinalproject_Editaccountsection = ProjectAccount.saveeditaccount(params) # Account    
    
    if savingfinalproject_Editaccountsection == 4
       
    savingfinalproject_editrewardssection = ProjectReward.saveeditRewards(params) #Rewards    

    if savingfinalproject_editrewardssection == 5
    
    flash[:projectUpdated] = "Success, project has been updated."
    render plain: savingfinalproject_editrewardssection.inspect
        
    end #Endif Rewards    
    end #Endif Account   
    end #Endif AboutYou
    end #Endif Story
    end #Endif Basic   
    end #Endif Present?   
        
        
    end #function ends
      
      
      
      
      
    def changeProjectstatus
     
        
       changeProjectstatus = Project.changeprojectstatus(params)
        render plain: changeProjectstatus.inspect
    end #function ends


    def deletefiles
        
        @filename = params[:project_file_name]
        @del_Files =  ProjectFile.delete_all("id = #{params[:file_id]} AND project_id = #{params[:project_id]}")
        
        #Deleting Previous Uploaded Image  
        if File.exist?(Rails.root.join('app/assets/images/project/' + params[:project_id] + '/project_images/' + @filename))
        File.delete(Rails.root.join('app/assets/images/project/' + params[:project_id] + '/project_images/' + @filename))
        end  
        
        render plain: @del_Files.inspect 
    end    
    #Function Ends  
      
      

  end #Main class end
end #Module Backend End
