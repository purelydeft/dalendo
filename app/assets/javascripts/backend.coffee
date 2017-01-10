# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



########### Admin Login Working


$(document).ready ->

  ###-- Start Admin Login --###

  $('#loginAdminButton123').click ->
    adminemail = $('#email').val()
    if adminemail == ''
      $('#email').css 'borderColor', '#BA6765'
      $('#adminemailerr').css('display', 'block').css 'color', '#BA6765'
    adminpassword = $('#password').val()
    if adminpassword == ''
      $('#password').css 'borderColor', '#BA6765'
      $('#adminpassworderr').css('display', 'block').css 'color', '#BA6765'
      return false
    else
      $.ajax
        type: 'POST'
        url: '/backend/adminlogin'
        data:
          adminemail: adminemail
          adminpassword: adminpassword
        success: (resp) ->
          if resp == 1
            window.location.href = '/backend/dashboard'
          else if resp == 2
            $('#adminCreditionlsmsz').css 'display', 'block' .css 'color', '#BA6765'
            $('#adminCreditionlsmsz').after '<br>'
            $('#email').css 'border-color', '#BA6765'
            $('#password').css 'border-color', '#BA6765'
          return
    return
  return




########### Admin Login Validation Working

#$(document).ready ->
#  $('#email').keyup ->
#    adminemail = $('#email').val()
#    $('#adminCreditionlsmsz').css 'display', 'none'
#    if adminemail == ''
#      $('#email').css 'borderColor', '#BA6765'
#      $('#adminemailerr').css('display', 'block').css 'color', '#BA6765'
#    else
#      $('#email').css 'borderColor', ''
#      $('#adminemailerr').css 'display', 'none'
#    return
#
#  $('#password').keyup ->
#    adminpassword = $('#password').val()
#    if adminpassword == ''
#      $('#password').css 'borderColor', '#BA6765'
#      $('#adminpassworderr').css('display', 'block').css 'color', '#BA6765'
#    else
#      $('#password').css 'borderColor', ''
#      $('#adminpassworderr').css 'display', 'none'
#    return
#  return


########### Changing User-Status From Backend & Delete User Function

$(document).ready ->
  $('.userstatus').on 'click', ->
    currentdiv = $(this)
    userstatus = currentdiv.attr('data-userstatus')
    userid = currentdiv.attr('data-userid')
    $.ajax
      url: '/backend/changeUserstatus'
      type: 'Post'
      data:
        userstatus: userstatus
        userid: userid
      success: (resp) ->
        if resp = 1
          $('#activeid_' + userid).html 'Inactive'
        if resp = 2
          $('#activeid_' + userid).html 'Active'
        return
    return




########## Editing Users Function By Admin With Validations

$(document).ready ->
  $('#editUser').on 'click', ->
    errorchecker = 0
    userid = $('#userid').val()
    firstname = $('#edit_firstname').val()
    lastname = $('#edit_lastname').val()
    register_ip = $('#edit_registerip').val()
    login_ip = $('#edit_loginip').val()
    userstatus = $('input[name=userstatus]:checked').val()
    alreadyuploadedimg = $('#userimagerandom').val()
    imageuser = $('#imageuser').val()
    
    if firstname == ''
      $('#firstnameerr').css('display', 'block').css 'color', '#BA6765'
      $('#edit_firstname').css 'borderColor', '#BA6765'
      errorchecker = 1
    if lastname == ''
      $('#lastnameerr').css('display', 'block').css 'color', '#BA6765'
      $('#edit_lastname').css 'borderColor', '#BA6765'
      errorchecker = 1
    if register_ip == ''
      $('#registeriperr').css('display', 'block').css 'color', '#BA6765'
      $('#edit_registerip').css 'borderColor', '#BA6765'
      errorchecker = 1
    if login_ip == ''
      $('#loginiperr').css('display', 'block').css 'color', '#BA6765'
      $('#edit_loginip').css 'borderColor', '#BA6765'
      errorchecker = 1 
        
    if errorchecker > 0
      return false
    else
      $('#editUserForm').submit()
    return
  return


####### Editing Users Key-Up Validations 

$(document).ready ->
  $('#edit_firstname').keyup ->
    firstname = $('#edit_firstname').val()
    if firstname == ''
      $('#firstnameerr').css('display', 'block').css 'color', '#BA6765'
      $('#edit_firstname').css 'borderColor', '#BA6765'
    else
      $('#firstnameerr').css 'display', 'none'
      $('#edit_firstname').css 'borderColor', ''
    return
  $('#edit_lastname').keyup ->
    lastname = $('#edit_lastname').val()
    if lastname == ''
      $('#lastnameerr').css('display', 'block').css 'color', '#BA6765'
      $('#edit_lastname').css 'borderColor', '#BA6765'
    else
      $('#lastnameerr').css 'display', 'none'
      $('#edit_lastname').css 'borderColor', ''
    return
  $('#edit_registerip').keyup ->
    register_ip = $('#edit_registerip').val()
    if register_ip == ''
      $('#registeriperr').css('display', 'block').css 'color', '#BA6765'
      $('#edit_registerip').css 'borderColor', '#BA6765'
    else
      $('#registeriperr').css 'display', 'none'
      $('#edit_registerip').css 'borderColor', ''
    return
  $('#edit_loginip').keyup ->
    login_ip = $('#edit_loginip').val()
    if login_ip == ''
      $('#loginiperr').css('display', 'block').css 'color', '#BA6765'
      $('#edit_loginip').css 'borderColor', '#BA6765'
    else
      $('#loginiperr').css 'display', 'none'
      $('#edit_loginip').css 'borderColor', ''
    return
  return






############ Start Delete User Function


$(document).ready ->
  $('.trashusers123').on 'click', ->
    currentdiv = $(this)
    userid = currentdiv.attr('data-userid')
    profileimage = currentdiv.attr('data-profileimage')
    swal {
      title: 'Are you sure?'
      text: 'You will not be able to recover this User!'
      type: 'warning'
      showCancelButton: true
      confirmButtonClass: 'btn-danger'
      confirmButtonText: 'Yes, delete it!'
      closeOnConfirm: false
    }, ->
      $.ajax
        type: 'post'
        url: '/backend/deleteUser'
        data:
          userid: userid
          profileimage: profileimage
        success: (resp) ->
          if resp == 1
            $('#usersAllshowingdiv_' + userid).hide()
            swal 'Deleted!', 'User has been deleted.', 'success'
          return
      return
    return
  return



############ End Delete User Function






############ Start Category Module Function In Coffee 1085 line-no in backend-custom.js file (same in js)

$(document).ready ->
  $('input:radio[name="radio"]').change ->
    if $(this).val() == 'icon_request'
      $('#icon-images').css 'display', 'block'
      $('#cat-image').css 'display', 'none'
      $('#imagenameerrmsz').css 'display', 'none'
    else
      $('#cat-image').css 'display', 'block'
      $('#icon-images').css 'display', 'none'
      $('#iconname1').css 'display', 'none'
      $('#imagenameerrmsz').css 'display', 'none'
    return
  $('input:radio[name="radios"]').change ->
    currenticonname = $('#editcategory_previousHidden_categoryIcon').val()
    currentimagename = $('#editcategory_previousHidden_categoryImage').val()
    if $(this).val() == 'icon_request'
      $('#icon-images').css 'display', 'block'
      $('#editcat_image').css 'display', 'none'
      $('#iconname').val currenticonname
      $('#edit_categoryimage').val ''
      $('#blah').css 'display', 'none'
      $('#editicon-images').css 'display', 'block'
      $('#cat-image').css 'display', 'none'
      $('#newcatimgerrmsz').css 'display', 'none'
    else
      $('#editcat_image').css 'display', 'block'
      $('#icon-images').css 'display', 'none'
      $('#editicon-images').css 'display', 'none'
      $('#editicon-images').val ''
      $('#cat-image').css 'display', 'block'
      $('#iconname1').css 'display', 'none'
      $('#editted_iconnameBlankmsz').css 'display', 'none'
    return
  $('#iconname').click ->
    $('#categoryimage').val ''
    $('#cat-image').css 'display', 'none'
    $('#blah').css 'display', 'none'
    $('#imagenameerrmsz').css 'display', 'none'
    return
  $('#categoryimage').click ->
    $('#iconname').val ''
    $('#icon-images').css 'display', 'none'
    $('#iconnameerrmsz').css 'display', 'none'
    return
  $('.active').click ->
    $('.categorystatus').val 'active'
    return
  $('.inactive').click ->
    $('.categorystatus').val 'inactive'
    return

  ###*****Category Save Function Starts*****###
#
  $('#categorysavebutton').on 'click', ->
    formData = new FormData($('#addcategoryid')[0])
    errorchecker = 0
    categoryname = $('#categoryname').val()
    categorydescription = $('#addcategory_category_decription').val()
    iconname = $('#iconname').val()
    categoryimagename = $('#categoryimage').val()
    categorystatus = $('#addcategory_category_status').val()
    if $('#radio01').is(':checked') and iconname == ''
      $('#iconname1').css('display', 'block').css 'color', '#A94442'
      #.delay(1000).fadeOut();
      errorchecker = 1
    if $('#radio02').is(':checked') and categoryimagename == ''
      $('#imagenameerrmsz').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    #if $('#radio01').is(':unchecked') and $('#radio02').is(':unchecked')
      #$('#imagenameerrmsz').css('display', 'block').css 'color', '#A94442'
      #errorchecker = 1
    if categoryname == ''
      $('#categoryname1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if categorydescription == ''
      $('#addcategory_category_decription1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if errorchecker > 0
      return false
    else
      $(this).val('Please wait ...').attr 'disabled', 'disabled'        
      $.ajax
        url: '/backend/add-category'
        type: 'post'
        data: formData
        contentType: false
        cache: false
        processData: false
        success: (resp) ->
          if resp = 1
#            document.getElementById('addcategoryid').reset()
#            $('#blah').css 'display', 'none'
#            swal 'Success!', 'Your category has been added!', 'success'
#            setTimeout (->
              window.location.href = '/backend/category-management'
#              return
#            ), 1000
          return
    return
  return


$(document).ready ->
  $('.trashcat').click ->
    currentdiv = $(this)
    categoryid = currentdiv.attr('data-catid')
    categoryimage = currentdiv.attr('data-catimage')
    swal {
      title: 'Are you sure?'
      text: 'You will not be able to recover this Category!'
      type: 'warning'
      showCancelButton: true
      confirmButtonClass: 'btn-danger'
      confirmButtonText: 'Yes, delete it!'
      closeOnConfirm: false
    }, ->
      $.ajax
        url: '/backend/delete-category'
        type: 'post'
        data:
          categoryid: categoryid
          categoryimage: categoryimage
        success: (resp) ->
          if resp = 1
            $('#categoryviewline_' + categoryid).hide()
            swal 'Deleted!', 'Your Category has been deleted.', 'success'
          return
      return
    return
  return



$(document).ready ->
  $('#categoryupdatebutton').click ->
    formData = new FormData($('#editcategoryid')[0])
    errorchecker = 0
    categoryid = $('#editcategory_hidden_catId').val()
    editted_categoryName = $('#editcategoryname').val()
    editted_categoryDescription = $('#editcategory_editcategory_decription').val()
    editted_iconname = $('#iconname').val()
    editted_cateImage = $('#edit_categoryimage').val()
    editted_cateStatus = $('#editcategory_editedcategorystatus').val()
    newcatimg = $('#edit_categoryimages').val()
    if editted_categoryName == ''
      $('#editcategoryname1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if editted_categoryDescription == ''
      $('#editcategory_editcategory_decription1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if $('#radio01').is(':checked') and editted_iconname == ''
      $('#iconname1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if errorchecker > 0
      return false
    else
      $.ajax
        url: '/backend/edit-category'
        type: 'post'
        data: formData
        contentType: false
        cache: false
        processData: false
        success: (resp) ->
          if resp = 1
            window.location.href = '/backend/category-management'
          return
    return
  return

############ End Category Module Function





















