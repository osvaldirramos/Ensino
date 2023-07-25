document.observe('dom:loaded', function() { 

jQuery(document).on("xepOnlineStatus", function(event, state){
    if (state == "Started"){
        var screenTop = jQuery(document).scrollTop();
    	var screenHeight = jQuery(window).height();
        jQuery('#spinner-overlay').css('top', screenTop);
        jQuery('#spinner-overlay').css('height', screenHeight);
        jQuery('#spinner-overlay').toggle('show');
    }
    else if (state == "Finished"){
        jQuery('#spinner-overlay').toggle('hide');
    }
});

})