App.request = App.cable.subscriptions.create("RequestChannel", {
	connected: function() {
    // Called when the subscription is ready for use on the server

},

disconnected: function() {
    // Called when the subscription has been terminated by the server
},

received: function(data) {
	
	if((data.request_id%4) == 1){
		return $('#request-holder').prepend(this.renderNewRequest(data));
	}
	else{

		return $('#request-holder').children().first().prepend(this.renderOldRequest(data));

	}
	// return $('#request-holder').prepend(this.renderRequest(data));
},
renderNewRequest: function(data) {
	return "<div class='row'><div class='col-md-3'><div class='panel panel-red'><div class='panel-heading'><div class='row'><div class='col-sm-12'><i class='fa fa-support'></i><span> Incoming Request # "+data.request_id+"</span></div></div></div><a href=/requests/"+data.request_id+"><div class='panel-footer'><span class='pull-left'>Type: "+data.requests_type+"</span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i></span><div class='clearfix'></div></div></a></div></div></div>";
},
renderOldRequest: function(data) {
	return "<div class='col-md-3'><div class='panel panel-red'><div class='panel-heading'><div class='row'><div class='col-sm-12'><i class='fa fa-support'></i><span> Incoming Request # "+data.request_id+"</span></div></div></div><a href=/requests/"+data.request_id+"><div class='panel-footer'><span class='pull-left'>Type: "+data.requests_type+"</span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i></span><div class='clearfix'></div></div></a></div></div>";
}
});