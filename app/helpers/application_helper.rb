module ApplicationHelper

	def alert_for(flash_type)  
		{ success: 'alert-success',
			error: 'alert-danger',
			alert: 'alert-warning',
			notice: 'alert-info'
			}[flash_type.to_sym] || flash_type.to_s
	end  

	def is_active?(link_path)
  		if current_page?(link_path)
    		"active"
  		else
    		""
  		end
 	end

end
