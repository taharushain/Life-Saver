// App.request = App.cable.subscriptions.create("RequestDetailChannel", {
// 	connected: function() {
//     // Called when the subscription is ready for use on the server

// },

// disconnected: function() {
//     // Called when the subscription has been terminated by the server
// },

// received: function(data) {
// 	if((data.request_id%4) == 1){
// 		return $('#request-data-received-holder').prepend(this.renderNewRequestDetail(data));
// 	}
// 	else{

// 		return $('#request-data-received-holder').children().first().prepend(this.renderOldRequestDetail(data));

// 	}
// 	// return $('#request-holder').prepend(this.renderRequest(data));
// },
// renderNewRequestDetail: function(data) {
// 	return "<div class='row'><div class='col-md-3'><div class='panel panel-red'><div class='panel-heading'><div class='row'><div class='col-sm-12'><i class='fa fa-support'></i><span> Request # "+data.request_id+"</span></div></div></div><a href=/requests/"+data.request_id+"><div class='panel-footer'><span class='pull-left'>Data Received</span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i></span><div class='clearfix'></div></div></a></div></div></div>";
// },
// renderOldRequestDetail: function(data) {
// 	return "<div class='col-md-3'><div class='panel panel-red'><div class='panel-heading'><div class='row'><div class='col-sm-12'><i class='fa fa-support'></i><span> Incoming Request # "+data.request_id+"</span></div></div></div><a href=/requests/"+data.request_id+"><div class='panel-footer'><span class='pull-left'>Data Received</span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i></span><div class='clearfix'></div></div></a></div></div>";
// }
// });