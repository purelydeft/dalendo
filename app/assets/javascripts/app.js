$(document).ready(function(){
	

	$(".dalando_sidebar_nav").mCustomScrollbar({
					theme:"minimal-dark"
				});
					
	$('.dalando_sidebar_nav').css('height', $(window).height()-75);
	
	
	
		
});

$(window).resize(function(){
	$('.dalando_sidebar_nav').css('height', $(window).height()-75);
});


$(document).ready(function() {
	
	$( window ).resize( function(){
	if ($(window).width() < 992) {
	$('.dalando_sidebar_panel').addClass('icone_menu');
	$('.dalando_app_wrapper').addClass('sidebar_icone');
  }
else {
   $('.dalando_sidebar_panel').removeClass('icone_menu');
   $('.dalando_app_wrapper').removeClass('sidebar_icone');
}
});

	if ($(window).width() < 992) {
	$('.dalando_sidebar_panel').addClass('icone_menu');
	$('.dalando_app_wrapper').addClass('sidebar_icone');
	
	   $(".menu").click(function() {
	$(".dalando_app_wrapper").toggleClass('sidebar_icone');
	$(".dalando_sidebar_panel").toggleClass('icone_menu');
	});
	
	
  }
else {
   $('.dalando_sidebar_panel').removeClass('icone_menu');
   $('.dalando_app_wrapper').removeClass('sidebar_icone');
   
   
}



	
	$(".inactive").click(function() {
		$(this).parent().removeClass('active_bg');
		$(this).parent().addClass('inactive_bg');
		});
		
		$(".active").click(function() {
		$(this).parent().removeClass('inactive_bg');
		$(this).parent().addClass('active_bg');	
		});
		
    $(".menu").click(function() {
	$(".dalando_app_wrapper").toggleClass('sidebar_icone');
	$(".dalando_sidebar_panel").toggleClass('icone_menu');
	$(".footer").toggleClass("footer_margin_class");
	});
	
	$(".payment-listing li").click(function(){
			$(".payment-listing li").removeClass("active");
			$(this).addClass("active");	
		});
		
		
		
		
		
	
		
		
	
		
});





window.onload = function () {
	 CanvasJS.addColorSet("greenShades",
                [//colorSet Array

                "#e03141",
                "#e2e2e2",
                "#00004c",
                "#008ca9",
                "#e2e2e2"                
                ]);
	var chart = new CanvasJS.Chart("chartContainer11",
	
	{
		colorSet: "greenShades",
		title:{
			text: ""
		},
		legend: {
			maxWidth: 350,
			itemWidth: 120
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			legendText: "{indexLabel}",
			dataPoints: [
				{ y: 1256, indexLabel: "Cancel" },
				{ y: 1250, indexLabel: "Requested" },
				{ y: 2035, indexLabel: "Inprogress" },
				{ y: 4520, indexLabel: "Completed"},
			]
		}
		]
	});
	chart.render();
	
	
	CanvasJS.addColorSet("newcolore",
                [//colorSet Array

                "#008ca9",
                "#e03141",
                          
                ]);
	var chart = new CanvasJS.Chart("chartContainer22",
	
	{
		colorSet: "newcolore",
		title:{
			text: "",
			fontFamily: "Impact",
			fontWeight: "normal"
		},

		legend:{
			verticalAlign: "bottom",
			horizontalAlign: "center"
		},
		data: [
		{
			//startAngle: 45,
			indexLabelFontSize: 20,
			indexLabelFontFamily: "Garamond",
			indexLabelFontColor: "darkgrey",
			indexLabelLineColor: "darkgrey",
			indexLabelPlacement: "outside",
			type: "doughnut",
			showInLegend: true,
			dataPoints: [
				{  y: 95.37, legendText:"Active User: 95%", indexLabel: "Active User: 95%" },
				{  y: 20.0, legendText:"Inactive User: 5%", indexLabel: "Inactive User: 5%" },
				]
		}
		]
	});

	chart.render();
}



