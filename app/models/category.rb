class Category < ApplicationRecord
 
    
    #Function For Adding Categories
    def self.addcategory(paramsdata)
        
      $created_at          = Time.now.to_s(:db)
      $updated_at          = Time.now.to_s(:db)
      $categoryname        = paramsdata['addcategory']['categoryname']    
      $categoryicon        = paramsdata['addcategory']['iconname']      
      $categorydescription = paramsdata['addcategory']['category_decription']    
      $categorystatus      = paramsdata['addcategory']['category_status']
      $original_filename   = ''
        
      if paramsdata['category_image'].present?
          
        $filename              = paramsdata['category_image'].original_filename #image name
        $string                = SecureRandom.hex(6) #generate random number
        
        $original_filename     = "#{$string}_" + $filename
        
        
        $uploaded              = paramsdata['category_image'] # all file data

        File.open(Rails.root.join('app/assets/images', 'categoryImages', $original_filename), 'wb') do |file|
        file.write($uploaded.read)
        end          
          
        
      end
        
        @connection = ActiveRecord::Base.connection    
        result      = @connection.exec_query("INSERT INTO categories (category_name, category_description, category_icon, category_image, category_status, created_at, updated_at) VALUES ('#$categoryname', '#$categorydescription', '#$categoryicon', '#$original_filename', '#$categorystatus', '#$created_at', '#$updated_at')")

        if result == nil

        returngiver = 1     
        return returngiver

        end        
      
        
    end
    #Function Ends
    
    
    
    #Function For Getting All-categories

    def self.getallcategories()

      @connection = ActiveRecord::Base.connection
      result      = @connection.exec_query("SELECT * FROM categories ORDER BY id DESC")
      return result.to_a

    end



    #Function For Getting Single-Category
    def self.sinlecategoryData(paramsdata)

        $categoryid = paramsdata[:cid]
        @connection = ActiveRecord::Base.connection
        result      = @connection.exec_query("SELECT * FROM categories WHERE id='#$categoryid'")
        return result.to_a

    end



    #Function For Delete Single-Category
    def self.deletecategory(paramsdata)

        $categoryid    = paramsdata[:categoryid]
        $categoryimage = paramsdata[:categoryimage]

        @connection = ActiveRecord::Base.connection
        result      = @connection.exec_query("DELETE FROM categories WHERE id='#$categoryid'")

        if File.exist?(Rails.root.join('app/assets/images', 'categoryImages', $categoryimage))
         File.delete(Rails.root.join('app/assets/images', 'categoryImages', $categoryimage))
        end

        if result == nil

          returngiver = 1
          return returngiver

        end

    end



    #Function Starts For Editing Category
    def self.editCategorystarts(paramsdata)

      $categoryid           = paramsdata['editcategory']['hidden_catId']
      $updated_at           = Time.now.to_s(:db)
      $editedcategoryname   = paramsdata['editcategory']['editcategoryname']
      $editedcategorydesc   = paramsdata['editcategory']['editcategory_decription']
      $editedcategorystatus = paramsdata['editcategory']['editedcategorystatus']
      $editediconname       = paramsdata['editcategory']['iconname']
      $previous_catImage    = paramsdata['editcategory']['previousHidden_categoryImage']



      if paramsdata['edit_category_images'].present? && $editediconname == ''

        $filename              = paramsdata['edit_category_images'].original_filename #image name
        $string                = SecureRandom.hex(6) #generate random number

        $original_filename     = "#{$string}_" + $filename


        $uploaded              = paramsdata['edit_category_images'] # all file data

        File.open(Rails.root.join('app/assets/images', 'categoryImages', $original_filename), 'wb') do |file|
          file.write($uploaded.read)
        end

        if $previous_catImage != ''
          File.delete(Rails.root.join('app/assets/images', 'categoryImages', $previous_catImage))
        end


      elsif paramsdata['edit_category_images'].present? == false && $editediconname == ''

         $original_filename    = $previous_catImage

      elsif $editediconname != ''

         $original_filename    = ''
         if $previous_catImage != ''
           File.delete(Rails.root.join('app/assets/images', 'categoryImages', $previous_catImage))
         end

      end



      @connection = ActiveRecord::Base.connection
      result      = @connection.exec_query("UPDATE categories SET category_name='#$editedcategoryname', category_description='#$editedcategorydesc', category_icon='#$editediconname', category_image='#$original_filename', category_status='#$editedcategorystatus', updated_at='#$updated_at' WHERE id='#$categoryid'")

      if result == nil

        returngiver = 1
        return returngiver

      end


    end
    
    
    
    def self.changeCategorystatus(paramsdata)
        
        $categoryid     = paramsdata['catid']
        $categorystatus = paramsdata['catstatus']
        
        if $categorystatus == 'active'
           
           $finalstatus = 'inactive'   
            
          @connection = ActiveRecord::Base.connection
          result      = @connection.exec_query("UPDATE categories SET category_status='#$finalstatus' WHERE id='#$categoryid'")
            
                    if result == nil

                    returngiver = 1
                    return returngiver

                    end #Endif
            
        else
            
           $finalstatus = 'active'
           @connection = ActiveRecord::Base.connection
           result      = @connection.exec_query("UPDATE categories SET category_status='#$finalstatus' WHERE id='#$categoryid'")
            
                    
        if result == nil

        returngiver = 2
        return returngiver

        end #Endif
            
        end #Endif
        

        
    end
    #Function Ends

end
