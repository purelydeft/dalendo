$(document).ready ->
  $('.active').click ->
    $('.badgesstatus').val 'active'
    return
  $('.inactive').click ->
    $('.badgesstatus').val 'inactive'
    return
  return


$(document).ready ->
  $('#badgesavebutton').on 'click', ->
    formData = new FormData($('#addbadgesid')[0])
    errorchecker = 0
    badgename = $('#badgename').val()
    badgedescription = $('#addbadges_badge_decription').val()
    badgeimagename = $('#badgeimage').val()
    badgestatus = $('#addbadges_badges_status').val()
    if badgename == ''
      $('#badgename1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if badgename != ''
      if !lettersonly(badgename)
        $('#badgename3').css('display', 'block').css 'color', '#A94442'
        $('html, body').animate { scrollTop: 0 }, 1000
        errorchecker = 1
      else
        $('#badgename3').css 'display', 'none'
    if badgedescription == ''
      $('#addbadges_badge_decription1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if badgeimagename == ''
      $('#badgeimageerrmsz').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if errorchecker > 0
      return false
    else
      $(this).val('Please wait ...').attr 'disabled', 'disabled'          
      $.ajax
        url: '/backend/add-badges'
        type: 'post'
        data: formData
        contentType: false
        cache: false
        processData: false
        success: (resp) ->
          if resp = 1
            #Note Swal is working now in flash message
            #$('#blah').css('display','none');
            #swal("Success!", "Your badge has been added!", "success");  
            #setTimeout(function()
            #{
            window.location.href = '/backend/badges-management'
            #}, 2000);
          return
    return
  return



$(document).ready ->
  $('.trashbadge').on 'click', ->
    currentdiv = $(this)
    badgeid = currentdiv.attr('data-badgeid')
    badgeimage = currentdiv.attr('data-badgeimage')
    swal {
      title: 'Are you sure?'
      text: 'You will not be able to recover this Badge!'
      type: 'warning'
      showCancelButton: true
      confirmButtonClass: 'btn-danger'
      confirmButtonText: 'Yes, delete it!'
      closeOnConfirm: false
    }, ->
      $.ajax
        type: 'post'
        url: '/backend/delete-badges'
        data:
          badgeid: badgeid
          badgeimage: badgeimage
        success: (resp) ->
          if resp = 1
            $('#badgesviewline_' + badgeid).hide()
            swal 'Deleted!', 'Badge has been deleted.', 'success'
          return
      return
    return
  return



$(document).ready ->
  $('#badgeupdatebutton').on 'click', ->
    formData = new FormData($('#editbadgesid')[0])
    errorchecker = 0
    badgeid = $('#editbadges_hidden_badgeid').val()
    editted_badgeName = $('#editbadgename').val()
    editted_badgeDescription = $('#editbadges_editbadge_decription').val()
    if editted_badgeName == ''
      $('#editbadgename1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if editted_badgeName != ''
      if !lettersonly(editted_badgeName)
        $('#editbadgename3').css('display', 'block').css 'color', '#A94442'
        $('html, body').animate { scrollTop: 0 }, 1000
        errorchecker = 1
      else
        $('#badgename3').css 'display', 'none'        
    if editted_badgeDescription == ''
      $('#editbadges_editbadge_decription1').css('display', 'block').css 'color', '#A94442'
      errorchecker = 1
    if errorchecker > 0
      return false
    else
      $.ajax
        url: '/backend/edit-badges'
        type: 'post'
        data: formData
        contentType: false
        cache: false
        processData: false
        success: (resp) ->
          if resp = 1
            window.location.href = '/backend/badges-management'
          return
    return
  return