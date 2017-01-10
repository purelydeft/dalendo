/*----------------------- START DOCUMENT.READY PORTION ----------------------*/


$(document).ready(function () {
    
    
    
// $("#click1").click(function ()
// {
//
//     $("#rewardsDiv").hide();
//     $("#storyDiv").hide();
//     $("#storySub").hide();
//     $("#rewardSub").hide();
//     $("#aboutyouDiv").hide();
//     $("#basicDiv").css('display', 'block');
//
// });
//
//
//
// $("#click2").click(function ()
// {
//
//     $("#basicDiv").hide();
//     $("#storyDiv").hide();
//     $("#storySub").hide();
//     $("#aboutyouDiv").hide();
//     $("#rewardsDiv").css('display', 'block');
//     $("#rewardSub").css('display', 'block');
//
// });
//
//
// $("#click3").click(function ()
// {
//
//     $("#basicDiv").hide();
//     $("#rewardsDiv").hide();
//     $("#rewardSub").hide();
//     $("#aboutyouDiv").hide();
//     $("#storyDiv").css('display', 'block');
//     $("#storySub").css('display', 'block');
//
// });
//
// $("#click4").click(function ()
// {
//
//     $("#basicDiv").hide();
//     $("#rewardsDiv").hide();
//     $("#rewardSub").hide();
//     $("#storyDiv").hide();
//     $("#storySub").hide();
//     $("#aboutyouDiv").css('display','block');
//
// });
//


    // $('#click5').click(function()
    //
    // {
    //     $('#aboutyouDiv').css('display','none');
    //     $('#basicDiv').css('display','none');
    //     $('#rewardsDiv').css('display','none');
    //     $('#accountdiv').css('display','block');
    // });
    
    
/*-- Start Admin Login --*/


$("#loginAdminButton").click(function ()
{
    var adminemail  = $('#email').val();

    if (adminemail === '')
    {
        $('#email').css('borderColor', '#BA6765');
        $('#adminemailerr').css('display', 'block').css('color', '#BA6765');
    }

    var adminpassword   = $('#password').val();
    if (adminpassword === '')
    {
        $('#password').css('borderColor', '#BA6765');
        $('#adminpassworderr').css('display', 'block').css('color', '#BA6765');
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
                        $('#adminCreditionlsmsz').css('display', 'block').css('color', '#BA6765');

                        $('#email').css('border-color', '#BA6765');
                        $('#password').css('border-color', '#BA6765');
                    }

				}

			});



});


/*-- End Admin Login --*/







    /*--------------------- START ADD-USER -------------------------*/

     $('#contactno').bind('keyup paste', function()
    {
        this.value = this.value.replace(/[^0-9]/g, '');
    }); 

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
     $('#rewardsDiv').css('display','none');
     $('#click2').removeClass('smallcustom');
     $('#basicli').removeClass('last');
     $('#click1').addClass('smallcustom');
     $('#rewardSub').css('display','none');
     $('html, body').animate({scrollTop: 10}, 1000);

});

$('#backtorewards').click(function()
{
     $('#rewardsDiv').css('display','block');
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
		    $('#rewardsDiv').css('display','none');
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
        var project_video = $("#project_video").val();

        if(project_video === '')
        {
            $("#emptyicon").css('display','block');
            return false;
        }
        else
        {
            $("#emptyicon").css('display','none');
        }

        /*-- start validation for video extensions --*/

        var file = $('#project_video')[0].files[0]
        if (file)
        {
            var videoName = file.name
            var imageSize = file.size
        }

        img_array = videoName.split('.');
        name = img_array[0];
        exe  = img_array[1];

        if (!(exe == 'mp4'))
        {
            $("#emptyicon").css('display','none');
            $("#wrongicon").css('display','block');
            return false;
        }
        else
        {
            $("#wrongicon").css('display','none');
        }

        /*-- end validation for image extensions --*/


        var project_desc = $("#project_desc").val();
        if(project_desc === '')
        {
            $("#project_desc").focus();
            $("#emptydescription").css('display','block');
            return false;
        }
        else
        {
            $("#emptydescription").css('display','none');
        }

        var project_risk = $("#project_risk").val();
        if(project_risk === '')
        {
            $("#project_risk").focus();
            $("#emptyrisk").css('display','block');
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



function isContachNumber(contactno) {
   var pattern =/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
   return pattern.test(contactno);  // returns a boolean
}


/*---- END Function For Email Validation ---*/



/*---- START Function For Checking Video Extension For Valid Video Selection Which works on Onchange ---*/

var _validVideoFileExtensions = [".mov", ".mpeg", ".avi", ".mp4", ".3gp", ".wmv", ".flv"];

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
//
//         var formData = new FormData($('#addcategoryid')[0]);
//         var errorchecker = 0;
//         var categoryname = $('#categoryname').val();
//         var categorydescription = $('#addcategory_category_decription').val();
//         var iconname = $('#iconname').val();
//         var categoryimagename = $('#categoryimage').val();
//         var categorystatus = $('#addcategory_category_status').val();
//
//         if($('#radio01').is(':checked') && iconname == '')
//         {
//             $('#iconnameerrmsz').css('display','block').css('color','#A94442');
//             //.delay(1000).fadeOut();
//             errorchecker =1;
//         }
//
//         if($('#radio02').is(':checked') && categoryimagename == '')
//         {
//             $('#imagenameerrmsz').css('display','block').css('color','#A94442');
//             errorchecker =1;
//         }
//
//         if($('#radio01').is(':unchecked') && $('#radio02').is(':unchecked'))
//         {
//             $('#imagenameerrmsz').css('display','block').css('color','#A94442');
//             errorchecker =1;
//         }
//
//         if(categoryname == '')
//         {
//             $('#categoryerrmsz').css('display','block').css('color','#A94442');
//             errorchecker =1;
//         }
//         if(categorydescription == '')
//         {
//              $('#categorydescriptionerrmsz').css('display','block').css('color','#A94442');
//             errorchecker =1;
//         }
//
//         if(errorchecker > 0)
//             {
//                 return false;
//             }
//         else
//             {
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
//                                  document.getElementById("addcategoryid").reset();
//                                  $('#blah').css('display','none');
//                                  swal("Success!", "Your category has been added!", "success");
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
//                     $('#blah').css('display','none');
//                     swal("Success!", "Your badge has been added!", "success");
//                     setTimeout(function()
//                     {
//                         window.location.href="/backend/badges-management";
//                     }, 1000);
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

        var timeDiff = Math.abs(date_final - date_ini );
        var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

        if(diffDays < 30)
		{
		 	$('#onemontherr').css('display','block').css('color','#A94442');
            errochecker = 1
     	}
     	if(projecttype == '')
        {
            $('#projecterr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
		if(projectimage == '')
		{
		  	$('#projectimgerr').css('display','block').css('color','#A94442');
		  	errochecker = 1
		}
        if(projectuser == '')
        {
            $('#projectusererr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projecttitle == '')
        {
            $('#projecttitleerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projectblurb == '')
        {
            $('#projectblurberr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projectlang == '')
        {
            $('#projectlangerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projectcategory == '')
        {
            $('#projectcategoryerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projectlocation == '')
        {
            $('#projectlocationerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projectstart == '')
        {
            $('#projectstarterr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projectend == '')
        {
            $('#projectenderr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if (date_ini > date_final)
        {
            $('#projectgreatererr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(projectcurrency == '')
        {
            $('#projectcurrencyerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(fundinggoal == '')
        {
            $('#projectfundgoalerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }

        if(minfundinggoal == '')
        {
            $('#projectminfundgoalerr').css('display','block').css('color','#A94442');
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
            $('#rewardsDiv').css('display','block');
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
            $('#aboutyou_firstnameerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }

        if(aboutyou_lastname == '')
        {
            $('#aboutyou_lastnameerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_stucture == '')
        {
            $('#aboutyou_stuctureerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_address == '')
        {
            $('#aboutyou_addresserr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_country == '')
        {
            $('#aboutyou_countryerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_nationality == '')
        {
            $('#aboutyou_nationalityerr').css('display','block').css('color','#A94442');
            errochecker = 1
        }
        if(aboutyou_phoneno == '')
        {
            $('#aboutyou_phonenoerr').css('display','block').css('color','#A94442');
            errochecker = 1
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

    var Usercountry = $('#aboutyou_country').val();

    getnationality(Usercountry);

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



function getnationality(obj)
 {
     $.ajax({

                url:"/backend/add-project",
                type:"Post",
                dataType: 'json',
                data: {
                        obj:obj
                      },
                success: function(resp)
                {
                       $('#aboutyou_nationality').val(resp);
                       $('.selectpicker').selectpicker('refresh')
                }

           });

 }






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
          $('#bankemailerr').css('display','block').css('color','#A94442');
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
                  if(resp == 'true')
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
          $('#emptyemailmsz').css('display','block').css('color','#A94442');
          $('#paypalemailerr').css('display','none');
          errochecker = 1;
          return false;
      }

      if( !isEmailAddress(paypalemail))
      {
          $('#paypalemailerr').css('display','block').css('color','#A94442');
          $('#emptyemailmsz').css('display','none');
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
                      if(resp == 'true')
                      {alert(resp);
                          window.location.href="/backend/project-management";
                      }

                  }

              });
          }
      }

  });
    
        
    
});


