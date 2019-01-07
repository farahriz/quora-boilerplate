$('.btn').click(function(){
	console.log($(this))
});


$(function() {
  $("ul.tabs li").click(function(){
    $(this).css({'color':'white','background':'black'});
  });
});