module ActionDispatch
  class Response
    def success?
      self.code == "200"
    end
  end
  class Request
    def cancel?
      self.parameters["cancel"] == "true"
    end
  end
end

class CallbackHooks < FatFreeCRM::Callback::Base
  def app_after_filter(app_controller,context)
    #Rails.logger.debug("controller is "+app_controller.class.name+":"+app_controller.action)
    Rails.logger.debug("action is #{app_controller.action_name}")
    Rails.logger.debug("name is #{app_controller.class.name}")
    Rails.logger.debug("request is #{app_controller.request.parameters}")
    Rails.logger.debug("response is #{app_controller.response.success?}")
    Rails.logger.debug("response is #{app_controller.request.cancel?}")

    if request_processable?(app_controller)
    #if 200 response && 'promote' && leadcontroller lead -> contact -> account
     Rails.logger.debug(method_name(app_controller).to_s)
     if self.respond_to?(method_name(app_controller))
      self.send(method_name(app_controller),app_controller.request.parameters)
     end
    end

  end



  def leads_controller_promote(params)
    Rails.logger.debug("called method")
    #id => Lead
    #Lead->contact->account
    @lead = Lead.find(params[:id])
    #redirect_to ffcrm_freshbooks_path(@lead)


  end



  private

  def method_name(app)
    "#{app.class.name.underscore}_#{app.action_name}".to_sym
  end

  def request_processable?(app_controller)
      app_controller.response.success? && !app_controller.request.cancel?
  end



end