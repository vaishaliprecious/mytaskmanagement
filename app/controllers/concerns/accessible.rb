# controllers/concerns/accessible.rb
module Accessible
    extend ActiveSupport::Concern
    included do
      before_action :check_resource
    end
  
    protected
  
    def check_resource
      if member_signed_in?
        flash.clear
        redirect_to(members_authenticated_root_path) and return
      elsif user_signed_in?
        flash.clear
        redirect_to(users_authenticated_root_path) and return
      end
    end
  end