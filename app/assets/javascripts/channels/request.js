App.request = App.cable.subscriptions.create("RequestChannel", {
	connected: function() {
    // Called when the subscription is ready for use on the server

},

disconnected: function() {
    // Called when the subscription has been terminated by the server
},

received: function(data) {
	console.log("hospital_id: "+$('#request-holder').attr('hospital_id'));


	if(data.hospital_id == $('#request-holder').attr('hospital_id')){
		if(data.remove == false){
			var num_of_reqs_on_view = $("div[incomming='true']").length;
			console.log("Remove: false, num_of_reqs_on_view="+$("div[incomming='true']").length);

			if((num_of_reqs_on_view%4) == 0){//new
				return $('#request-holder').prepend(this.renderNewRequest(data));
			}
			else{
				//old
				console.log("chi:"+$('#request-holder').children().length);

				if($('#request-holder').children().length > 0){
					console.log("has children");
				}else{
					console.log("does not have childred");
					return $('#request-holder').append(this.renderNewRequest(data));
				}

				return $('#request-holder').children().first().prepend(this.renderOldRequest(data));
			}

		}
	}else{
		if(data.remove == true){
			console.log("Remove: True");
			console.log("div[ambulance_user_id='"+data.ambulance_user_id+"'][incomming='true']");
			console.log($("div[ambulance_user_id='"+data.ambulance_user_id+"'][incomming='true']").length);
			$("div[ambulance_user_id='"+data.ambulance_user_id+"'][incomming='true']").remove();
			
		}
		
	}



	// return $('#request-holder').prepend(this.renderRequest(data));
},
renderNewRequest: function(data) {
	
	var temp = "<div class='row'><div class='col-md-3' request_id='"+
					data.request_id+
					"' ambulance_user_id='"+
					data.ambulance_user_id+
					"' incomming='true'><div class='panel panel-red'><div class='panel-heading'><div class='row'><div class='col-sm-12'><i class='fa fa-support'></i><span> Incoming Request # "+
					data.request_id+
					"</span></div></div></div><a href=/requests/"+
					data.request_id+">"+
					"<div class='panel-footer'><span class='pull-left'>Blood Pressure: "+
					data.blood_pressure+
					"</span><div class='clearfix'></div></div>";

			temp+="<div class='panel-footer'><span class='pull-left'>Critical Condition: ";
			if(data.critial_condition == true)
				temp+="Yes";
			else
				temp+="No";
			temp+="</span><div class='clearfix'></div></div>";

			temp+="<div class='panel-footer'><span class='pull-left'>ICU Required: ";
			if(data.critial_condition == true)
				temp+="Yes";
			else
				temp+="No";
			temp+="</span><div class='clearfix'></div></div>";

			temp+="<div class='panel-footer'><span class='pull-left'>CCU Required: ";
			if(data.requests_type == "Cardiac arrest" || data.requests_type == "Heart attack" )
				temp+="Yes";
			else
				temp+="No";
			temp+="</span><div class='clearfix'></div></div>";

			temp+="<div class='panel-footer'><span class='pull-left'>Ventilator Required: ";
			if(data.breathing == "Low")
				temp+="Yes";
			else
				temp+="No";
			temp+="</span><div class='clearfix'></div></div>";

				temp+="<div class='panel-footer'><span class='pull-left'>Temperature: "+
					data.temperature+
					"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Breathing problem: "+
					data.breathing+
					"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Pulse Rate: "+
					data.pulse_rate+
					"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Type: "+
					data.requests_type+
					"</span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i></span><div class='clearfix'></div></div></a></div></div></div>";


	return temp;

	//return "<div class='row'><div class='col-md-3' request_id='"+data.request_id+"' ambulance_user_id='"+data.ambulance_user_id+"' incomming='true'><div class='panel panel-red'><div class='panel-heading'><div class='row'><div class='col-sm-12'><i class='fa fa-support'></i><span> Incoming Request # "+data.request_id+"</span></div></div></div><a href=/requests/"+data.request_id+"><div class='panel-footer'><span class='pull-left'>Blood Pressure: "+data.blood_pressure+"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Temperature: "+data.temperature+"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Breathing problem: "+data.breathing+"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Pulse Rate: "+data.pulse_rate+"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Type: "+data.requests_type+"</span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i></span><div class='clearfix'></div></div></a></div></div></div>";
},
renderOldRequest: function(data) {


	var temp = "<div class='col-md-3' request_id='"+
				data.request_id+
				"' ambulance_user_id='"+
				data.ambulance_user_id+
				"' incomming='true'><div class='panel panel-red'><div class='panel-heading'><div class='row'><div class='col-sm-12'><i class='fa fa-support'></i><span> Incoming Request # "+
				data.request_id+
				"</span></div></div></div><a href=/requests/"+
				data.request_id+">"+
				"<div class='panel-footer'><span class='pull-left'>Blood Pressure: "+
				data.blood_pressure+
				"</span><div class='clearfix'></div></div>";

			temp+="<div class='panel-footer'><span class='pull-left'>Critical Condition: ";
			if(data.critial_condition == true)
				temp+="Yes";
			else
				temp+="No";
			temp+="</span><div class='clearfix'></div></div>";

			temp+="<div class='panel-footer'><span class='pull-left'>ICU Required: ";
			if(data.critial_condition == true)
				temp+="Yes";
			else
				temp+="No";
			temp+="</span><div class='clearfix'></div></div>";

			temp+="<div class='panel-footer'><span class='pull-left'>CCU Required: ";
			if(data.requests_type == "Cardiac arrest" || data.requests_type == "Heart attack" )
				temp+="Yes";
			else
				temp+="No";
			temp+="</span><div class='clearfix'></div></div>";

			temp+="<div class='panel-footer'><span class='pull-left'>Ventilator Required: ";
			if(data.breathing == "Low")
				temp+="Yes";
			else
				temp+="No";
			temp+="</span><div class='clearfix'></div></div>";


			temp+="<div class='panel-footer'><span class='pull-left'>Temperature: "+
				data.temperature+
				"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Breathing problem: "+
				data.breathing+
				"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Pulse Rate: "+
				data.pulse_rate+
				"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Type: "+
				data.requests_type+
				"</span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i></span><div class='clearfix'></div></div></a></div></div>";

// <div class='panel-footer'><span class='pull-left'>Blood Pressure: "+
// 				data.blood_pressure+
// 				"</span><div class='clearfix'></div></div>


	
	return temp;
	//return "<div class='col-md-3' request_id='"+data.request_id+"' ambulance_user_id='"+data.ambulance_user_id+"' incomming='true'><div class='panel panel-red'><div class='panel-heading'><div class='row'><div class='col-sm-12'><i class='fa fa-support'></i><span> Incoming Request # "+data.request_id+"</span></div></div></div><a href=/requests/"+data.request_id+"><div class='panel-footer'><span class='pull-left'>Blood Pressure: "+data.blood_pressure+"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Temperature: "+data.temperature+"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Breathing problem: "+data.breathing+"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Pulse Rate: "+data.pulse_rate+"</span><div class='clearfix'></div></div><div class='panel-footer'><span class='pull-left'>Type: "+data.requests_type+"</span><span class='pull-right'><i class='fa fa-arrow-circle-right'></i></span><div class='clearfix'></div></div></a></div></div>";
}
});
