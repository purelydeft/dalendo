 /******USER Change Function Starts******/
function changeUserstatus(uid,status)
{
    if (status == 'active')
    {
        swal({
             title: "Are you sure?",
             text: "Do you want to Inactive User!",
             type: "warning",
             showCancelButton: true,
             confirmButtonClass: "btn-danger",
             confirmButtonText: "Yes, change it!",
             closeOnConfirm: false
         },
         function(){

             $.ajax({
                        type: "post",
                        url: "/backend/changeuser-status",
                        data: {
                                uid:uid,
                                status:status
                              },
                        success: function (resp)
                        {

                          if(resp == 1)
                          {
                              /*swal("Success!", "User status has been changed.", "success");
                              setTimeout(function()
                              {*/
                                  window.location.href="/backend/user-management";

                              /*}, 1000);*/
                          }
                        }
                   });
         });
    }
    
    
    if (status == 'inactive')
    {
        swal({
             title: "Are you sure?",
             text: "Do you want to Active user!",
             type: "warning",
             showCancelButton: true,
             confirmButtonClass: "btn-danger",
             confirmButtonText: "Yes, change it!",
             closeOnConfirm: false
         },
         function(){

             $.ajax({
                        type: "post",
                        url: "/backend/changeuser-status",
                        data: {
                                uid:uid,
                                status:status
                              },
                        success: function (resp)
                        {

                          if(resp == 2)
                          {
                              /*swal("Success!", "User status has been changed.", "success");
                              setTimeout(function()
                              {*/
                                  window.location.href="/backend/user-management";

                              /*}, 1000);*/
                          }
                        }
                   });
         });   
    }
     

     


 };



 /******Category Change Function Starts******/

  function changeCategorystatus(catid,catstatus)
  { 
       if (catstatus == 'active')
       {
          swal({
                 title: "Are you sure?",
                 text: "Do you want to Inactive category!",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonClass: "btn-danger",
                 confirmButtonText: "Yes, change it!",
                 closeOnConfirm: false
             },
             function(){
             
                 $.ajax({
                            type: "post",
                            url: "/backend/change-category-status",
                            data: {
                                    catid:catid,
                                    catstatus:catstatus
                                  },
                            success: function (resp)
                            {

                              if(resp == 1)
                              {
//                                  swal("Success!", "Category status has been changed.", "success");
//                                  setTimeout(function()
//                                  {
                                      window.location.href="/backend/category-management";
//                                  }, 1000);
                              }
                            }
                       });
             });
       }
      
      if (catstatus == 'inactive')
      {
          swal({
                 title: "Are you sure?",
                 text: "Do you want to Active category!",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonClass: "btn-danger",
                 confirmButtonText: "Yes, change it!",
                 closeOnConfirm: false
             },
             function(){
             
                 $.ajax({
                            type: "post",
                            url: "/backend/change-category-status",
                            data: {
                                    catid:catid,
                                    catstatus:catstatus
                                  },
                            success: function (resp)
                            {

                              if(resp == 2)
                              {
//                                  swal("Success!", "Category status has been changed.", "success");
//                                  setTimeout(function()
//                                  {
                                      window.location.href="/backend/category-management";
//                                  }, 1000);
                              }
                            }
                       });
             });
       }
       
  };




function changeBadgestatus(badgeid,badgestatus)
{
    if (badgestatus == 'active')
    {
        swal({
                 title: "Are you sure?",
                 text: "Do you want to Inactive badge!",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonClass: "btn-danger",
                 confirmButtonText: "Yes, change it!",
                 closeOnConfirm: false
             },
             function(){
             
                 $.ajax({
                            type: "post",
                            url: "/backend/change-badge-status",
                            data: {
                                    badgeid:badgeid,
                                    badgestatus:badgestatus
                                  },
                            success: function (resp)
                            {

                              if(resp == 1)
                              {
                                  /*swal("Success!", "Badge status has been changed.", "success");*/
/*                                  setTimeout(function()
                                  {*/
                                      window.location.href="/backend/badges-management";
                                  
/*                                  }, 2000);*/
                              }
                            }
                       });
             });   
    }
    
    
    if (badgestatus == 'inactive')
    {
        swal({
                 title: "Are you sure?",
                 text: "Do you want to Active badge!",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonClass: "btn-danger",
                 confirmButtonText: "Yes, change it!",
                 closeOnConfirm: false
             },
             function(){
             
                 $.ajax({
                            type: "post",
                            url: "/backend/change-badge-status",
                            data: {
                                    badgeid:badgeid,
                                    badgestatus:badgestatus
                                  },
                            success: function (resp)
                            {

                              if(resp == 2)
                              {
                                  /*swal("Success!", "Badge status has been changed.", "success");*/
/*                                  setTimeout(function()
                                  {*/
                                      window.location.href="/backend/badges-management";
                                  
/*                                  }, 2000);*/
                              }
                            }
                       });
             });   
    }
       
    
};






/*----------------------- START DOCUMENT.READY PORTION ----------------------*/


$(document).ready(function () {
    

/*--------------- Start Remove Sorting From <th> ACTION </th> -----------------*/
  
    remove_sorting_icon();
    

    jQuery('th').on('click',function(){
        remove_sorting_icon();
    });
    

    function remove_sorting_icon() {
        
      jQuery('th').each(function(){
          
        col_text = jQuery(this).text();
          
        if(col_text == 'Action' || col_text == 'Image' || col_text == 'Icon/Image' || col_text == 'Project Image')
        {
            jQuery(this).removeClass('sorting');
            jQuery(this).removeClass('sorting_asc');
            jQuery(this).removeClass('sorting_desc');
        }
          
      });
    }
    
/*--------------- End Remove Sorting From <th> ACTION </th> -----------------*/
    
    
    

    
/*--------------------- Start Admin Login Keyup Function -----------------*/
    
$('#email').keyup(function(){
      
    var adminemail = $('#email').val();
    
    $('#adminCreditionlsmsz').css('display', 'none');
      
    if (adminemail === '' )
    {
        $('#email').css('borderColor', '#a94442');
        $('#adminemailerr').css('display', 'block').css('color', '#a94442');
    }
    else
    {
        $('#email').css('borderColor', '');
        $('#adminemailerr').css('display', 'none');
    }
    
});
    
    
    
    
$('#password').keyup(function(){
      
    var adminpassword = $('#password').val();
      
    if (adminpassword === '' )
    {
        $('#password').css('borderColor', '#a94442');
        $('#adminpassworderr').css('display', 'block').css('color', '#a94442');
    }
    else
    {
        $('#password').css('borderColor', '');
        $('#adminpassworderr').css('display', 'none');
    }
    
});
    
    
/*--------------------- End Admin Login Keyup Function -----------------*/



//$("#click1").click(function ()
//{
//
//    $("#rewardsDiv").hide();
//    $("#storyDiv").hide();
//    $("#storySub").hide();
//    $("#rewardSub").hide();
//    $("#aboutyouDiv").hide();
//    $("#basicDiv").css('display', 'block');
//
//});
//
//
//
//$("#click2").click(function ()
//{
//
//    $("#basicDiv").hide();
//    $("#storyDiv").hide();
//    $("#storySub").hide();
//    $("#aboutyouDiv").hide();
//    $(".mainRewardDiv").css('display', 'block');
//    $("#rewardSub").css('display', 'block');
// 
//});
//
//
//$("#click3").click(function ()
//{
//
//    $("#basicDiv").hide();
//    $(".mainRewardDiv").hide();
//    $("#rewardSub").hide();
//    $("#aboutyouDiv").hide();
//    $("#storyDiv").css('display', 'block');
//    $("#storySub").css('display', 'block');
//
//});
//
//$("#click4").click(function ()
//{
//
//    $("#basicDiv").hide();
//    $("#rewardsDiv").hide();
//    $("#rewardSub").hide();
//    $("#storyDiv").hide();
//    $("#storySub").hide();
//    $("#aboutyouDiv").css('display','block');
//
//});
//
//
//
//    $('#click5').click(function()
//
//    {
//        $('#aboutyouDiv').css('display','none');
//        $('#basicDiv').css('display','none');
//        $('#rewardsDiv').css('display','none');
//        $('#accountdiv').css('display','block');
//    });


/*-- Start Admin Login --*/


$("#loginAdminButton").click(function ()
{
    var adminemail  = $('#email').val();

    if (adminemail === '')
    {
        $('#email').css('borderColor', '#a94442');
        $('#adminemailerr').css('display', 'block').css('color', '#a94442');
    }

    var adminpassword   = $('#password').val();
    if (adminpassword === '')
    {
        $('#password').css('borderColor', '#a94442');
        $('#adminpassworderr').css('display', 'block').css('color', '#a94442');
        return false;
    }

    if($('#remember_me').is(':checked'))
    {
        var remember_me = $('#remember_me').val();
    }


    $.ajax({

				type: "POST",
				url: "/backend/adminlogin",
                data: { adminemail:adminemail, adminpassword:adminpassword, remember_me:remember_me },
				success: function (resp)
                {
					//alert(resp);

                    if (resp == 1)
                    {
						 window.location.href = '/backend/dashboard';
					}
                    else if(resp == 2)
                    {
                        $('#adminCreditionlsmsz').css('display', 'block').css('color', '#a94442');

                        $('#email').css('border-color', '#a94442');
                        $('#adminemailerr').css('display', 'none');
                        
                        $('#password').css('border-color', '#a94442');
                        $('#adminpassworderr').css('display', 'none');
                    }

				}

			});



});


/*-- End Admin Login --*/







    /*--------------------- START ADD-USER -------------------------*/

    /*$('#contactno').bind('keyup paste', function()
    {
        this.value = this.value.replace(/[^0-9]/g, '');
    }); */

	/*--------------------- END ADD-USER -------------------------*/





    /******USER Delete Function Starts******/

     $('.trashusers').on('click',function ()
     {
         var currentdiv    = $(this);
         var userid    = currentdiv.attr('data-userid');
         var profileimage = currentdiv.attr('data-profileimage');
         swal({
                 title: "Are you sure?",
                 text: "You will not be able to recover this User!",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonClass: "btn-danger",
                 confirmButtonText: "Yes, delete it!",
                 closeOnConfirm: false
             },
             function(){
                 $.ajax({
                            type: "post",
                            url: "/backend/deleteUser",
                            data: {
                                    userid:userid,
                                    profileimage:profileimage
                                  },
                            success: function (resp)
                            {

                              if(resp == 1)
                              {
                                  $('#usersAllshowingdiv_'+userid).hide();
                                  swal("Deleted!", "User has been deleted.", "success");
                              }
                            }
                       });
             });
     });

   /******USER Delete Function Ends******/
                         
                         
                         
                         


$('#backtobasic').click(function()
{

     $('#basicDiv').css('display','block');
     $('.mainRewardDiv').css('display','none');
     $('#click2').removeClass('smallcustom');
     $('#basicli').removeClass('last');
     $('#click1').addClass('smallcustom');
     $('#rewardSub').css('display','none');
     $('html, body').animate({scrollTop: 10}, 1000);

});

$('#backtorewards').click(function()
{
     $('.mainRewardDiv').css('display','block');
     $('#storyDiv').css('display','none');
     $('#click3').removeClass('smallcustom');
     $('#click2').addClass('smallcustom')
     $('#rewardSub').css('display','block');
     $('#rewardli').removeClass('last');
     $('html, body').animate({scrollTop: 10}, 1000);
});
    
    
    
    
   
 
    
/*--------------------- START SAVE REWARD -------------------------*/
    
    
    /* -- Start Validation For Numbers Only -- */   
    
    
    $("input[name='rewardamount[]']").keypress(function(event) {
            // Backspace, tab, enter, end, home, left, right
            // We don't support the del key in Opera because del == . == 46.
            var controlKeys = [8, 9, 13, 35, 36, 37, 39, 48];
            // IE doesn't support indexOf
            var isControlKey = controlKeys.join(",").match(new RegExp(event.which));
            // Some browsers just don't raise events for control keys. Easy.
            // e.g. Safari backspace.
            if (!event.which || // Control keys in most browsers. e.g. Firefox tab is 0
                (49 <= event.which && event.which <= 57) || // Always 1 through 9
                (48 == event.which && $(this).attr("value")) || // No 0 first digit
                isControlKey) { // Opera assigns values for control keys.

                $("#rewardamount1_empty").css('display', 'none');

                return;
            } else {
                $("#rewardamount_empty").css('display', 'none');
                $("#rewardamount1_empty").css('display', 'block');
                event.preventDefault();
            }
        });
    
    
    
/* -- End Validation For Numbers Only -- */ 
    
    
    
    
    $('#rewardSubmit').on('click',function()
    {
		var titles           		= [];
        var rewardAmounts           = [];
        var reward_descriptions     = [];
        var estimated_deliv_month   = [];
        var reward_shipping_details = [];
		
		var check = 0;

        $("input[name='title[]']").each(function() 
        {
            if(!$(this).val())
			{
                $("#title_empty").css('display', 'block');
                check = 1;
            }
			else
			{
				$("#title_empty").css('display', 'none');
                titles.push($(this).val());
			}
          
        });


        $("input[name='rewardamount[]']").each(function() 
        {
			if(!$(this).val())
			{
                $("#rewardamount_empty").css('display','block');
                check = 1;

            }
			else if (isNaN(this.value))
			{
				$("#rewardamount_empty").css('display','none');
                $("#rewardamount1_empty").css('display','block');

                check = 1;

			}
            else
            {
                $("#rewardamount1_empty").css('display','none');
                rewardAmounts.push($(this).val());
            }
        }); 





        $("textarea[name='reward_desc[]']").each(function() 
        {
            if(!$(this).val())
			{
                $("#rewarddesc_empty").css('display','block');

                check = 1;
            }
			else
			{
				$("#rewarddesc_empty").css('display','none');
                reward_descriptions.push($(this).val());
			}
          
        });

        
        $("input[name='estimated_deliv_month[]']").each(function() 
        {
            if(!$(this).val())
			{
                $("#month_empty").css('display','block');

                check = 1;
            }
			else
			{
				$("#month_empty").css('display','none');
                estimated_deliv_month.push($(this).val());
            }
          
        }); 
        


        $("textarea[name='reward_shipping_details[]']").each(function() 
        {
            if(!$(this).val())
			{
                $("#shipping_empty").css('display','block');

                check = 1;
            }
			else
			{
				$("#shipping_empty").css('display','none');
                reward_shipping_details.push($(this).val());
			}
          
        }); 
        
        
        if (check > 0)
        {
            return false;
        }
        else
        {
		    $('.mainRewardDiv').css('display','none');
            $('#rewardSub').css('display','none');
            $('#storyDiv').css('display','block');
            $('#storySub').css('display','block');
            $('#rewardli').addClass('last');
            $('#click2').removeClass('smallcustom');
            $('#click3').addClass('smallcustom');
            $('html, body').animate({scrollTop: 10}, 1000);

        }

        });
    
    
    
    
/*--------------------- END SAVE REWARD -------------------------*/
    
    
    
    
/*--------------------- START SAVE STORY -------------------------*/
    
    $('#storySubmit').click(function()
    {
        var project_video  = $("#project_video").val();
        var previous_video = $('#video').val();
        var errorchecker = 0;
        if(project_video === '' && previous_video == '')
        {
            $("#emptyicon").css('display','block');
            errorchecker = 1;
        }


        /*-- start validation for video extensions --*/
        if(previous_video == '') {
            var file = $('#project_video')[0].files[0]
            if (file) {
                var videoName = file.name
                var imageSize = file.size
            }

            img_array = videoName.split('.');
            name = img_array[0];
            exe = img_array[1];

            if (!(exe == 'mp4')) {
                $("#emptyicon").css('display', 'none');
                $("#wrongicon").css('display', 'block');
                  errorchecker = 1;
            }

        }

        /*-- end validation for image extensions --*/


        var project_desc = $("#project_desc").val();
        if(project_desc === '')
        {
            $("#project_desc1").css('display','block');
            errorchecker = 1;
        }


        var project_risk = $("#project_risk").val();
        if(project_risk === '')
        {
     
            $("#project_risk1").css('display','block');
              errorchecker = 1;
        }
       
        if(errorchecker > 0)
            {
                return false;
            }
        else
        {
            $("#emptyrisk").css('display','none');
            
            $('#basicDiv').css('display','none');
            $('#rewardsDiv').css('display','none');
            $('#storyDiv').css('display','none');
            $('#aboutyouDiv').css('display','block');
            $('#storyli').addClass('last');
            $('#click4').addClass('smallcustom');
            $('#click3').removeClass('smallcustom');
            $('html, body').animate({scrollTop: 10}, 1000);
        }


    });




/*--------------------- END SAVE STORY -------------------------*/    
    
    
    
    
    
    
    
    
    




});



/*------------------------------------ END DOCUMENT.READY PORTION ---------------------------------------------*/





/*------------------------------------ START FUNCTIONS PORTION ---------------------------------------------*/



/*---- START Function For Email Validation ---*/


function isEmailAddress(useremail) {
   var pattern =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
   return pattern.test(useremail);  // returns a boolean
}


function lettersonly(globalchar) {
   var pattern =/^[a-zA-Z ]+$/;
   return pattern.test(globalchar);  // returns a boolean
}


function alphanum(globalalphachar) {
   var pattern =/^[A-Za-z0-9 _.-]+$/;
   return pattern.test(globalalphachar);  // returns a boolean
}



function isContactNumber(contactno) {
   var pattern =/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
   return pattern.test(contactno);  // returns a boolean
}


/*---- END Function For Email Validation ---*/



/*---- START Function For Checking Video Extension For Valid Video Selection Which works on Onchange ---*/

var _validVideoFileExtensions = [".mp4"];

function ValidateSingleInputVideo(oInput) {
	if (oInput.type == "file") {
		var sFileName = oInput.value;
		if (sFileName.length > 0) {
			var blnValid = false;
			for (var j = 0; j < _validVideoFileExtensions.length; j++) {
				var sCurExtension = _validVideoFileExtensions[j];
				if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
					blnValid = true;
					break;
				}
			}

			if (!blnValid) {
                
				alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validVideoFileExtensions.join(", "));
				oInput.value = "";
				return false;
			}
		}
	}
	return true;
}


/*---- END Function For Checking Video Extension For Valid Video Selection Which works on Onchange ---*/


/*------------------------------------ END FUNCTIONS PORTION ---------------------------------------------*/

    

	/*----------------------- START UPDATE REWARD ------------------------*/


	$('#rewardUpdate').on('click', function () {
		var rid = $('#rid').val();
		var projectid = $('#projectid').val();

		var title = $('#title').val();
		var pledgeamount = $('#pledgeamount').val();
		var reward_desc = $('#reward_desc').val();
		var estimated_deliv_month = $('#estimated_deliv_month').val();
		var estimated_deliv_year = $('#estimated_deliv_year').val();
		var reward_shipping_details = $('#reward_shipping_details').val();



		$.ajax({

			url: "/backend/project-management/update-rewards",
			type: "Post",
			data: {
				rid: rid,
				projectid: projectid,
				title: title,
				pledgeamount: pledgeamount,
				reward_desc: reward_desc,
				estimated_deliv_month: estimated_deliv_month,
				estimated_deliv_year: estimated_deliv_year,
				reward_shipping_details: reward_shipping_details
			},
			success: function (resp) {
				if (resp == 1) {
					window.location.href = "/backend/project-management/show-rewards?pid=" + projectid + ""
				}
			}

		});


		/*----------------------- END UPDATE REWARD ------------------------*/





	});


	/*Delete Rewards*/


	$('.trashrewards').on('click', function () {

		var currentdiv = $(this);

		var projectid = currentdiv.attr('data-projectid');
		var rewardid = currentdiv.attr('data-rewardid');
		$.ajax({

			url: "/backend/project-management/delete-reward",
			type: "Post",
			data: {
				projectid: projectid,
				rewardid: rewardid
			},
			success: function (resp) {
				if (resp == 1) {
					$('#rewardsAllshowingdiv_' + rewardid).hide(1000);
				}
			}


		});

	});



	/*--------------------- START UPDATE STORY -------------------------*/


	$('#storyUpdate').on('click', function () {
		var project_video = $("#project_video").val();

		if (project_video === '') {
			var project_video = $("#project_hiddenVideo").val();
		} else {
			/*-- start validation for video extensions --*/

			var file = $('#project_video')[0].files[0]
			if (file) {
				var videoName = file.name
				var imageSize = file.size
			}

			img_array = videoName.split('.');
			name = img_array[0];
			exe = img_array[1];

			//if (!(exe == 'wmv' || exe == 'mp4' || exe == '3gp' || exe == 'mov' || exe == 'mpeg' || exe == 'avi' || exe == 'flv' || exe == 'wmv')) //MOV, MPEG, AVI, MP4, 3GP, WMV or FLV .5GB



			if (!(exe == 'mp4')) {
				$("#wrongicon").css('display', 'block').fadeOut(15000);
				return false;
			} else {
				$("#wrongicon").css('display', 'none');
			}

			/*-- end validation for image extensions --*/
		}


		var project_desc = $("#project_desc").val();
		if (project_desc === '') {
			$("#project_desc").focus();
			$("#emptydescription").css('display', 'block').fadeOut(5000);
			return false;
		}

		var project_risk = $("#project_risk").val();
		if (project_risk === '') {
			$("#project_risk").focus();
			$("#emptyrisk").css('display', 'block').fadeOut(5000);
			return false;
		} else {
			var formData = new FormData($('#editStoryform')[0]);

			var project_id = $("#project_id").val();
			var sid = $("#sid").val();

			$.ajax({

				type: "POST",
				url: "/backend/project-management/update-story",
				data: formData,
				contentType: false,
				cache: false,
				processData: false,
				success: function (resp) {
					if (resp == 1) {
						window.location.href = "/backend/project-management/show-story?pid=" + project_id + "";
					}

				}

			});
		}


	});




	/*--------------------- END UPDATE STORY -------------------------*/









/*-------------------My Category Works custom js------------------------ */

$(document).ready(function()
{
    /*-- start script for search-box  --*/
    
        jQuery('.dataTables_filter input').attr('placeholder','Search');
    
    /*-- start script for search-box  --*/
    
    
    
//     $('input:radio[name="radio"]').change(
//         function(){
//
//             if ($(this).val() == 'icon_request')
// 			{
//                 $('#icon-images').css('display','block');
//                 $('#cat-image').css('display','none');
//                 $('#imagenameerrmsz').css('display','none');
//
//             }
//             else
//             {
//                 $('#cat-image').css('display','block');
//                 $('#icon-images').css('display','none');
//                 $('#iconnameerrmsz').css('display','none');
//                 $('#imagenameerrmsz').css('display','none');
//
//             }
//         });
//
//     $('input:radio[name="radios"]').change(
//         function(){
//
//             var currenticonname  = $('#editcategory_previousHidden_categoryIcon').val();
//             var currentimagename = $('#editcategory_previousHidden_categoryImage').val();
//             if ($(this).val() == 'icon_request')
// 			{
//                 $('#icon-images').css('display','block');
//                 $('#editcat_image').css('display','none');
//                 $('#iconname').val(currenticonname);
//                 $('#edit_categoryimage').val('');
//                 $('#blah').css('display','none');
//
//
//
//                 $('#editicon-images').css('display','block');
//                 $('#cat-image').css('display','none')
//                 $('#newcatimgerrmsz').css('display','none')
//
//
//
//
//             }
//             else
//             {
//                 $('#editcat_image').css('display','block');
//                 $('#icon-images').css('display','none');
//
//
//
//                 $('#editicon-images').css('display','none');
//                 $('#editicon-images').val('');
//                 $('#cat-image').css('display','block');
//                 $('#iconnameerrmsz').css('display','none');
//                 $('#editted_iconnameBlankmsz').css('display','none');
//             }
//         });
//
//     $('#iconname').click(function()
//     {
//         $('#categoryimage').val('');
//         $('#cat-image').css('display','none');
//         $('#blah').css('display','none');
//         $('#imagenameerrmsz').css('display','none');
//     });
//
//     $('#categoryimage').click(function()
//     {
//         $('#iconname').val('');
//         $('#icon-images').css('display','none');
//         $('#iconnameerrmsz').css('display','none');
//     });
//
//
// 	$(".active").click(function () {
// 		$(".categorystatus").val('active');
// 	});
// 	$(".inactive").click(function () {
// 		$(".categorystatus").val('inactive');
// 	});
//
//
//
// 	/******Category Save Function Starts******/
//
//     $('#categorysavebutton').on('click',function()
//     {
//         var formData = new FormData($('#addcategoryid')[0]);
//         var errorchecker = 0;
//         var categoryname = $('#categoryname').val();
//         var categorydescription = $('#addcategory_category_decription').val();
//         var iconname = $('#iconname').val();
//         var categoryimagename = $('#categoryimage').val();
//         var categorystatus = $('#addcategory_category_status').val();
//       
//        if(categoryname == '')
//         {
//             $('#categoryname1').css('display','block').css('color','#A94442');
//             errorchecker =1;
//         }
//         if(categorydescription == '')
//         {
//              $('#addcategory_category_decription1').css('display','block').css('color','#A94442');
//             errorchecker =1;
//         }
//
//         if($('#radio01').is(':checked') && iconname == '')
//         {
//             $('#iconname1').css('display','block').css('color','#A94442');
//             //.delay(1000).fadeOut();
//             errorchecker =1;
//         }
//
//         if($('#radio02').is(':checked') && categoryimagename == '')
//         {
//             $('#imagenameerrmsz').css('display','block').css('color','#A94442');
//             errorchecker =1;
//         }
////
////         if($('#radio01').is(':unchecked') && $('#radio02').is(':unchecked'))
////         {
////             $('#imagenameerrmsz').css('display','block').css('color','#A94442');
////             errorchecker =1;
////         }
//
//
//
//         if(errorchecker > 0)
//             {
//                 return false;
//             }
//         else
//             {
//                $(this).val('Please wait ...')
//                .attr('disabled','disabled');
//                 $.ajax({
//
//                           url: "/backend/add-category",
//                           type: "post",
//                           data: formData,
//                           contentType: false,
//                           cache: false,
//                           processData:false,
//                           success: function(resp)
//                           {
//
//                              if(resp == 1)
//                              {
//
//                                  setTimeout(function()
//                                  {
//                                      window.location.href="/backend/category-management";
//                                  }, 1000);
//                              }
//                           }
//                       });
//             }
//
//     });
//
//     /******Category Save Function Ends******/
//
//
//     /******Category Delete Function Starts******/
//
//     $('.trashcat').on('click',function ()
//     {
//         var currentdiv    = $(this);
//         var categoryid    = currentdiv.attr('data-catid');
//         var categoryimage = currentdiv.attr('data-catimage');
//         swal({
//                 title: "Are you sure?",
//                 text: "You will not be able to recover this Category!",
//                 type: "warning",
//                 showCancelButton: true,
//                 confirmButtonClass: "btn-danger",
//                 confirmButtonText: "Yes, delete it!",
//                 closeOnConfirm: false
//             },
//             function(){
//                 $.ajax({
//                            url: "/backend/delete-category",
//                            type: "post",
//                            data: {
//                                    categoryid:categoryid,
//                                    categoryimage:categoryimage
//                                  },
//                            success: function (resp)
//                            {
//
//                              if(resp == 1)
//                              {
//                                  $('#categoryviewline_'+categoryid).hide();
//                                  swal("Deleted!", "Your Category has been deleted.", "success");
//                              }
//                            }
//                       });
//             });
//     });
//
//     /******Category Delete Function Ends******/
//
//
//
//
//    /******Category Update Function Starts******/
//
//    $('#categoryupdatebutton').on('click',function()
//    {
//    	  var formData = new FormData($('#editcategoryid')[0]);
//       var errorchecker                = 0;
//       var categoryid                  = $('#editcategory_hidden_catId').val();
//       var editted_categoryName        = $('#editcategoryname').val();
//       var editted_categoryDescription = $('#editcategory_editcategory_decription').val();
//       var editted_iconname            = $('#iconname').val();
//       var editted_cateImage           = $('#edit_categoryimage').val();
//       var editted_cateStatus          = $('#editcategory_editedcategorystatus').val();
//       var newcatimg                   = $('#edit_categoryimages').val();
//
//       if(editted_categoryName == '')
// 	  {
// 	  	$('#editcatblankmsz').css('display','block').css('color','#A94442');
// 	  	errorchecker = 1;
// 	  }
// 	  if(editted_categoryDescription == '')
//       {
//       	$('#editcatdescblankmsz').css('display','block').css('color','#A94442');
//         errorchecker = 1;
//       }
//       if($('#radio01').is(':checked') && editted_iconname == '')
// 	  {
//
// 	  	$('#editted_iconnameBlankmsz').css('display','block').css('color','#A94442');
// 	  	errorchecker = 1;
// 	  }
//
// 	       if(errorchecker > 0)
// 		   {
// 		   	return false;
// 		   }
// 		   else
// 		   {
//                $.ajax({
//
//                    url: "/backend/edit-category",
//                    type: "post",
//                    data: formData,
//                    contentType: false,
//                    cache: false,
//                    processData:false,
//                    success: function(resp)
//                    {
//
//                        if(resp == 1)
//                        {
//                            window.location.href="/backend/category-management";
//                        }
//                    }
//                });
// 		   }
//
//
//    });
//
//     /******Category Update Function Ends******/
//
//
//




/***********My Custom Js For Badges Management Starts Here*************/


//  $('.active').click(function()
//  {
// 	 $('.badgesstatus').val('active');
//  });
//
//
//  $('.inactive').click(function()
//  {
// 	 $('.badgesstatus').val('inactive');
//  });
//
//
// /***********Badge Save Working starts************/
//
// $('#badgesavebutton').on('click',function()
// {
//
//     var formData              = new FormData($('#addbadgesid')[0]);
//     var errorchecker          = 0;
//     var badgename             = $('#badgename').val();
//     var badgedescription      = $('#addbadges_badge_decription').val();
//     var badgeimagename        = $('#badgeimage').val();
//     var badgestatus           = $('#addbadges_badges_status').val();
//
//     if(badgename == '')
//     {
//         $('#badgeerrmsz').css('display','block').css('color','#A94442');
//         errorchecker =1;
//     }
//    
//       if(badgename != '')
//        {
//            if( !lettersonly(badgename))
//            {
//            $("#badgename3").css('display','block').css('color','#A94442');	
//            $('html, body').animate({scrollTop: 0 }, 1000);
//            errorchecker = 1;
//            }
//            else
//            {
//            $("#name3").css('display','none');	
//            }
//        }
//     if(badgedescription == '')
//     {
//         $('#badgedescriptionerrmsz').css('display','block').css('color','#A94442');
//         errorchecker =1;
//     }
//     if(badgeimagename == '')
//     {
//         $('#badgeimageerrmsz').css('display','block').css('color','#A94442');
//         errorchecker =1;
//     }
//
//     if(errorchecker > 0)
//     {
//         return false;
//     }
//     else
//     {
//         $.ajax({
//
//             url: "/backend/add-badges",
//             type: "post",
//             data: formData,
//             contentType: false,
//             cache: false,
//             processData:false,
//             success: function(resp)
//             {
//                 if(resp == 1)
// 				{
//                      //Note Swal is working now in flash message
//                    
//                      //$('#blah').css('display','none');
//                      //swal("Success!", "Your badge has been added!", "success");  
//                      //setTimeout(function()
//                      //{
//                         window.location.href="/backend/badges-management";
//                      //}, 2000);
//                 }
//             }
//         });
//     }
//
// });
//
//
//
//
//     $('.trashbadge').on('click',function ()
//     {
//         var currentdiv    = $(this);
//         var badgeid       = currentdiv.attr('data-badgeid');
//         var badgeimage    = currentdiv.attr('data-badgeimage');
//         swal({
//                 title: "Are you sure?",
//                 text: "You will not be able to recover this Badge!",
//                 type: "warning",
//                 showCancelButton: true,
//                 confirmButtonClass: "btn-danger",
//                 confirmButtonText: "Yes, delete it!",
//                 closeOnConfirm: false
//             },
//             function(){
//                 $.ajax({
//                     type: "post",
//                     url: "/backend/delete-badges",
//                     data: {
//                         badgeid:badgeid,
//                         badgeimage:badgeimage
//                     },
//                     success: function (resp)
//                     {
//
//                         if(resp == 1)
//                         {
//                             $('#badgesviewline_'+badgeid).hide();
//                             swal("Deleted!", "Badge has been deleted.", "success");
//                         }
//                     }
//                 });
//             });
//     });
//
//
//
//
//
//     /******Badge Update Function Starts******/
//
//     $('#badgeupdatebutton').on('click',function()
//     {
//         var formData = new FormData($('#editbadgesid')[0]);
//         var errorchecker                = 0;
//         var badgeid                     = $('#editbadges_hidden_badgeid').val();
//         var editted_badgeName           = $('#editbadgename').val();
//         var editted_badgeDescription    = $('#editbadges_editbadge_decription').val();
//
//         if(editted_badgeName == '')
//         {
//             $('#badgeNameerrmsz').css('display','block').css('color','#A94442');
//             errorchecker = 1;
//         }
//         if(editted_badgeDescription == '')
//         {
//             $('#editbadgedescblankmsz').css('display','block').css('color','#A94442');
//             errorchecker = 1;
//         }
//
//         if(errorchecker > 0)
//         {
//             return false;
//         }
//         else
//         {
//             $.ajax({
//
//                 url: "/backend/edit-badges",
//                 type: "post",
//                 data: formData,
//                 contentType: false,
//                 cache: false,
//                 processData:false,
//                 success: function(resp)
//                 {
//                     if(resp == 1)
//                     {
//                         window.location.href="/backend/badges-management";
//                     }
//                 }
//             });
//         }
//
//
//     });


	//****************My Project Management Js Starts From Here *****************//

    $('#savebasicpro').click(function()
	{
		 var errochecker       = 0;
		 var projecttype       = $('#project_type').val();
         var projectimage      = $('#projectimage').val();
         var projectuser       = $('#project_user').val();
         var projecttitle      = $('#projecttitle').val();
         var projectblurb      = $('#blurb').val();
         var projectlang       = $('#projectlang').val();
         var projectcategory   = $('#projectcategory').val();
         var projectlocation   = $('#location').val();
         var projectstart      = $('#projectstart').val();
         var projectend        = $('#projecend').val();
         var projectcurrency   = $('#projectcurrency').val();
         var fundinggoal       = $('#fundinggoal').val();
         var minfundinggoal    = $('#minfundinggoal').val();
         var date_ini          = new Date($('#projectstart').val()).getTime();
         var date_final        = new Date($('#projecend').val()).getTime();


         var previousprojectimg= $('#previousprojectimg').val();

         var timeDiff = Math.abs(date_final - date_ini );
         var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

        if(diffDays < 30)
		{
		 	$('#onemontherr').css('display','block').css('color','#A94442').delay(1000).fadeOut();
            errochecker = 1
     	}
     	if(projecttype == '')
        {
            $('#project_type1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
		if(projectimage == '' && previousprojectimg == '')
		{
		  	$('#projectimgerr').css('display','block').css('color','#A94442');
            $('html, body').animate({scrollTop: 10}, 1000);
		  	errochecker = 1
		}
        if(projectuser == '')
        {
            $('#project_user1').css('display','block').css('color','#A94442');
               $('html, body').animate({scrollTop: 10}, 1000);
            errochecker = 1
        }
        if(projecttitle == '')
        {
            $('#projecttitle1').css('display','block').css('color','#A94442');
               $('html, body').animate({scrollTop: 10}, 1000);
            errochecker = 1
        }
        if(projecttitle != '')
        {
            if( !lettersonly(projecttitle))
            {
                $("#projecttitle3").css('display','block').css('color','#A94442');	
                $('html, body').animate({scrollTop: 0 }, 1000);
                errorchecker = 1;
            }
            else
            {
                $("#projecttitle3").css('display','none');	
            }      
        
        }

        if(projectblurb == '')
        {
            $('#blurb1').css('display','block').css('color','#A94442');
               $('html, body').animate({scrollTop: 10}, 1000);
            errochecker = 1
        }
        if(projectlang == '')
        {
            $('#projectlang1').css('display','block').css('color','#A94442');
               $('html, body').animate({scrollTop: 10}, 1000);
            errochecker = 1
        }
        if(projectcategory == '')
        {
            $('#projectcategory1').css('display','block').css('color','#A94442');
               $('html, body').animate({scrollTop: 10}, 1000);
            errochecker = 1
        }
        if(projectlocation == '')
        {
            $('#location1').css('display','block').css('color','#A94442');
               $('html, body').animate({scrollTop: 10}, 1000);
            errochecker = 1
        }
        if(projectstart == '')
        {
            $('#projectstart1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projectend == '')
        {
            $('#projecend1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if (date_ini > date_final)
        {
            $('#projectgreatererr').css('display','block').css('color','#A94442').delay(1000).fadeOut();
            errochecker = 1
        }
        if(projectcurrency == '')
        {
            $('#projectcurrency1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(fundinggoal == '')
        {
            $('#fundinggoal1').css('display','block').css('color','#A94442');
            errochecker = 1
        }

        if(minfundinggoal == '')
        {
            $('#minfundinggoal1').css('display','block').css('color','#A94442');
            errochecker = 1
        }

        if(errochecker > 0)
		{
			return false;
		}
		else
		{
            $('#basicli').addClass('last');
		    $('#basicDiv').css('display','none');
            $('.mainRewardDiv').css('display','block');
            $('#rewardSub').css('display','block');
            $('#click2').addClass('smallcustom');
            $('#click1').removeClass('smallcustom');
            $('html, body').animate({scrollTop: 10}, 1000);


		}
    });



    $('#discardbutton').click(function()
	{
        swal({
                title: "You have unsaved changes",
                text: "Please save or discard your changes to continue",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes, discard it!",
                closeOnConfirm: true
            },
            function(){

                         //$('#addprojectsid')[0].reset();
                         window.location.href="/backend/add-project";

            });


    });



    $('#aboutyou_phoneno').bind('keyup paste', function()
    {
        this.value = this.value.replace(/[^0-9]/g, '');
    });


    $('#saveaboutpro').click(function()
	{
        var errochecker       = 0;
        var aboutyou_firstname       = $('#aboutyou_firstname').val();
        var aboutyou_lastname        = $('#aboutyou_lastname').val();
        var aboutyou_stucture        = $('#aboutyou_stucture').val();
        var aboutyou_address         = $('#aboutyou_address').val();
        var aboutyou_country         = $('#aboutyou_country').val();
        var aboutyou_nationality     = $('#aboutyou_nationality').val();
        var aboutyou_phoneno         = $('#aboutyou_phoneno').val();

        if(aboutyou_firstname == '')
        {
            $('#aboutyou_firstname1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        
        if(aboutyou_firstname != '')
        {
            if( !lettersonly(aboutyou_firstname))
            {
                $("#aboutyou_firstname3").css('display','block').css('color','#A94442');	
                $('html, body').animate({scrollTop: 0 }, 1000);
                errorchecker = 1;
            }
            else
            {
                $("#aboutyou_firstname3").css('display','none');	
            }
        }        

        if(aboutyou_lastname == '')
        {
            $('#aboutyou_lastname1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        
        if(aboutyou_lastname != '')
        {
            if( !lettersonly(aboutyou_lastname))
            {
                $("#aboutyou_lastname3").css('display','block').css('color','#A94442');	
                $('html, body').animate({scrollTop: 0 }, 1000);
                errorchecker = 1;
            }
            else
            {
                $("#aboutyou_lastname3").css('display','none');	
            }
        }    
        
        if(aboutyou_stucture == '')
        {
            $('#aboutyou_stucture1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_address == '')
        {
            $('#aboutyou_address1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_country == '')
        {
            $('#aboutyou_countryerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_nationality == '')
        {
            $('#aboutyou_nationality1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_phoneno == '')
        {
            $('#aboutyou_phoneno1').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_phoneno != '')
        {
            if (!isContactNumber(aboutyou_phoneno)) {
                $("#contactno3").css('display','block').css('color','#A94442');
                $('html, body').animate({scrollTop: 0 }, 1000);
                errorchecker = 1;
            }
            else if(aboutyou_phoneno.length < 10 || aboutyou_phoneno.length > 12 )
            {
                $("#contactno3").css('display','block').css('color','#A94442');
                $('html, body').animate({scrollTop: 0 }, 1000);
                errorchecker = 1;
            }        
            else
            {
                $("#contactno3").css('display','none');
            }
         }        


        if(errochecker > 0)
		{
			return false;
		}
		else
		{
			$('#aboutyouDiv').css('display','none');
			$('#aboutyouli').addClass('last');
			$('#accountdiv').css('display','block');
			$('#click5').addClass('smallcustom');
			$('#click4').removeClass('smallcustom');
            $('html, body').animate({scrollTop: 10}, 1000);
		}


    });



    $('#backstorybutton').click(function()
    {
         $('#aboutyouDiv').css('display','none');
         $('#storyDiv').css('display','block');
         $('#click4').removeClass('smallcustom')
         $('#storyli').removeClass('last')
         $('#click3').addClass('smallcustom')
         $('html, body').animate({scrollTop: 10}, 1000);
    });


$('#click1').addClass('smallcustom');


$('.backaboutyoubutton').click(function()
{
    $('#accountdiv').css('display','none');
    $('#aboutyouDiv').css('display','block');
    $('#click5').removeClass('smallcustom');
    $('#aboutyouli').removeClass('last');
    $('#click4').addClass('smallcustom');

    $('html, body').animate({scrollTop: 10}, 1000);

});

});
 /**Document Ready Ends**/


/*---- Function For Checking Image Extension For Valid Image Selection Which works on Onchange ---*/

var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];   

function ValidateSingleInput(oInput) {
    if (oInput.type == "file") {
        var sFileName = oInput.value;
         if (sFileName.length > 0) {
            var blnValid = false;
            for (var j = 0; j < _validFileExtensions.length; j++) {
                var sCurExtension = _validFileExtensions[j];
                if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                    blnValid = true;
                    break;
                }
            }
             
            if (!blnValid) {
                alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                oInput.value = "";
                return false;
            }
        }
    }
    return true;
}


/*------------------------------------ END FUNCTIONS PORTION ---------------------------------------------*/


$(document).ready(function () {

  /*************FInal Save Project************/

  $('.saveaccount').click(function()
  {
      var errorchecker      = 0;
      $('.custom2tab').find('input:text').val('');
      var accountholdername = $('#accountholdername').val();
      var email             = $('#accountholderemail').val();
      var bankname          = $('#bankname').val();
      var accountno         = $('#accountno').val();
      var ifsccode          = $('#ifsc').val();
      var typeofaccount     = $('#accountselect').val();
      if(accountholdername == '')
      {
          $('#accountholdername1').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      
        if(accountholdername != '')
        {
            if( !lettersonly(accountholdername))
            {
                $("#accountholdername3").css('display','block').css('color','#A94442');	
                $('html, body').animate({scrollTop: 0 }, 1000);
                errorchecker = 1;
            }
            else
            {
                $("#accountholdername3").css('display','none');	
            }
        }   
      
      if(email == '')
      {
          $('#accountholderemail1').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(!isEmailAddress(email) && email != '')
      {
          $('#accountholderemail3').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(bankname == '')
      {
          $('#bankname1').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      
      if(bankname != '')
        {
            if( !lettersonly(bankname))
            {
                $("#bankname3").css('display','block').css('color','#A94442');	
                $('html, body').animate({scrollTop: 0 }, 1000);
                errorchecker = 1;
            }
            else
            {
                $("#bankname3").css('display','none');	
            }
        }  
      
      if(accountno == '')
      {
          $('#accountno1').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(ifsccode == '')
      {
          $('#ifsc1').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(typeofaccount == '')
      {
          $('#accountselect1').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }

      if(errorchecker > 0)
      {
          return false;
      }
      else
      {
          
      $(this).val('Please wait ...')
      .attr('disabled','disabled');
          var formData = new FormData($('#addprojectsid')[0]);


          $.ajax({

              type: "POST",
              url: "/backend/add-project",
              data: formData,
              contentType: false,
              cache: false,
              processData: false,
              success: function (resp)
              {
                  if(resp == '5')
                  {
                      window.location.href="/backend/project-management";
                  }

              }

          });
      }

  });




  $('.saveaccount1').click(function()
  {
       var errochecker = 0;
       $('.custom1tab').find('input:text').val('');
       $('#accountselect option').prop('selected', function()
       {
           return this.defaultSelected;
       });


      var paypalemail = $('#paypalemail').val();

      if(paypalemail == '')
      {
          $('#paypalemail1').css('display','block').css('color','#A94442');
          errochecker = 1;
          return false;
      }

      if( !isEmailAddress(paypalemail))
      {
          $('#paypalemail3').css('display','block').css('color','#A94442');
          errochecker = 1;
          return false;
      }

      var payment_type = 'paypal';
      $('#payment_type').val(payment_type);

      $('#accountholderemail').val(paypalemail);

      if(errochecker > 0)
      {
          return false;
      }
      else
      {
          {
              
      $(this).val('Please wait ...')
      .attr('disabled','disabled');
              var formData = new FormData($('#addprojectsid')[0]);


              $.ajax({

                  type: "POST",
                  url: "/backend/add-project",
                  data: formData,
                  contentType: false,
                  cache: false,
                  processData: false,
                  success: function (resp)
                  {
                      if(resp == '5')
                      {
                          window.location.href="/backend/project-management";
                      }

                  }

              });
          }
      }

  });
    
    
    
    
    
/*---------------------------------Edit Project Managemement Starts From Here---------------------------------------*/
    
    
  $('.editaccount').click(function()
  {
      var errorchecker      = 0;
      $('.custom2tab').find('input:text').val('');
      var accountholdername = $('#accountholdername').val();
      var email             = $('#accountholderemail').val();
      var bankname          = $('#bankname').val();
      var accountno         = $('#accountno').val();
      var ifsccode          = $('#ifsc').val();
      var typeofaccount     = $('#accountselect').val();
      var payment_type = 'bank';
      $('#payment_type').val(payment_type);
      if(accountholdername == '')
      {
          $('#accountnameerr').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(email == '')
      {
          $('#accountemailerr').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(!isEmailAddress(email))
      {
          $('#bankemailerr').css('display','block').css('color','#A94442').delay(2000).fadeOut();
          $('#accountemailerr').css('display','none');
          errorchecker = 1;
      }
      if(bankname == '')
      {
          $('#banknameerr').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(accountno == '')
      {
          $('#accountnoerr').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(ifsccode == '')
      {
          $('#ifscnameerr').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }
      if(typeofaccount == '')
      {
          $('#typeofaccounterr').css('display','block').css('color','#A94442');
          errorchecker = 1;
      }

      if(errorchecker > 0)
      {
          return false;
      }
      else
      {
          var formData = new FormData($('#editprojectsid')[0]);


          $.ajax({

              type: "POST",
              url: "/backend/saveedit-project",
              data: formData,
              contentType: false,
              cache: false,
              processData: false,
              success: function (resp)
              {
                  if(resp == '5')
                  {
                      window.location.href="/backend/project-management";
                  }

              }

          });
      }

  });

    
    
  
    
  $('.editaccount1').click(function()
  {
       var errochecker = 0;
       $('.custom1tab').find('input:text').val('');
       $('#accountselect option').prop('selected', function()
       {
           return this.defaultSelected;
       });


      var paypalemail = $('#paypalemail').val();

      if(paypalemail == '')
      {
          $('#emptyemailmsz').css('display','block').css('color','#A94442');
          $('#paypalemailerr').css('display','none');
          errochecker = 1;
          return false;
      }

      if( !isEmailAddress(paypalemail))
      {
          $('#paypalemailerr').css('display','block').css('color','#A94442').delay(2000).fadeOut();
          $('#emptyemailmsz').css('display','none');
          errochecker = 1;
          return false;
      }

      var payment_type = 'paypal';
      $('#payment_type').val(payment_type);
     
      $('#accountholderemail').val(paypalemail);
      $('#accountselect').val(' ');

      if(errochecker > 0)
      {
          return false;
      }
      else
      {
          {
          var formData = new FormData($('#editprojectsid')[0]);


          $.ajax({

              type: "POST",
              url: "/backend/saveedit-project",
              data: formData,
              contentType: false,
              cache: false,
              processData: false,
              success: function (resp)
              {
                  if(resp == '5')
                  {
                      window.location.href="/backend/project-management";
                  }

              }

          });
          }
      }

  });
    
    
    
    
    
    
    
    
    
    
    
        
/*---------------------------------Edit Project Managemement Ends Here----------------------------------------------*/   

    
    
    
/*------CHange of project Status Starts Here--------*/
    
    
/*-------Used For Showing Popup Project Status Checked While Changing Status--------*/    
    
$('.complex').on('click',function()
{
  var status = $(this).attr('data-projectstatus');
  
  if(status == 1)
  {
     setTimeout(function(){  $('#a').prop('checked',true); }, 100);     
  }
  
  if(status == 2)
  {
     setTimeout(function(){  $('#d').prop('checked',true); }, 100);            
  }  
    
  if(status == 3)
  {
     setTimeout(function(){  $('#in').prop('checked',true); }, 100);            
  }
});
    

});

/*---------------Used For Showing Status Update Of :Project With Swal New Form--------------*/

 function complex (projectid,projectstatus) {    
     swal.withForm({
    title: 'Change project status',
    text: 'Please choose status to this project',
    showCancelButton: true,
    animation: "slide-from-bottom",     
    confirmButtonColor: '#86CCEB',
    confirmButtonText: 'Change status!',
    closeOnConfirm: true,
    formFields: [

      { name: 'projectstatus', value: 'Approved', type: 'radio', id:"a" },
      { name: 'projectstatus', value: 'Disapproved', type: 'radio', id:"d" },
      { name: 'projectstatus', value: 'Inactive', type: 'radio', id:'in' },
    ]
      
  }, function (isConfirm) {      
   
//console.log(this.swalForm)
        var status = this.swalForm;
         
        if(status.a == 'Approved')
        {
              var finalstatus = status.a
        }
        else if(status.d == 'Disapproved')
        {
              var finalstatus = status.d
        }
        else
        {
              var finalstatus = status.in
        }
         
         
        if(finalstatus != "")
            {
                $.ajax({

                         url:"/backend/changeproject-status",
                         type:"Post",
                         data: {
                                 projectid:projectid,
                                 finalstatus:finalstatus
                               },
                         success: function(resp)
                         {
                           
                            if(resp == 1)
                                {
                                    window.location.href="/backend/project-management";
                                }
                             
                         }
                });
            }
     
  })
      
}


/******************GLOBAL FUNCTION FOR REMOVING OR SHOWING ERROR MESSAGES***************************/

function removevalidations(arg)
{
   var inputid = arg.getAttribute('id');

    var valueOfinput = $('#'+inputid).val();

    if(valueOfinput != '')
    {
        $('#'+inputid+'1').css('display','none');
        $('#'+inputid+'3').css('display','none');
    }
    else
    {
        $('#'+inputid+'1').css('display','block');
        $('#'+inputid+'2').css('display','none');
        $('#'+inputid+'3').css('display','none');
        $('#fundnumric_msz').css('display','none');
    }
}


/******************GLOBAL FUNCTION FOR REMOVING OR SHOWING ERROR MESSAGES ENDS***************************/


/******************GLOBAL FUNCTION FOR ALPHANUMERIC ERROR MESSAGES STARTS***************************/



//function isalphanumeric(e,arg)  {
//    
//var inputid = arg.getAttribute('id');
//    
//if (e.ctrlKey || e.altKey) 
//{
//$('#'+inputid+'2').css('display','block');    
//$('#'+inputid+'1').css('display','none');    
//e.preventDefault();
//} else {
//var key = e.keyCode;
//if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
//$('#'+inputid+'2').css('display','none');    
//return true;
//}
//}
//}
