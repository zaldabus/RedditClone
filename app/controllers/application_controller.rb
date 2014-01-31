class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  def remove_nil(links)
    links.reject{ |link| link["title"].empty? || link["url"].empty? }
  end

  def mod_only(sub)
    redirect_to sub_url(sub) unless current_user.id == sub.mod_id
  end

  def submitted_user_only(link)
    redirect_to link_url(link) unless current_user.id == link.user_id
  end
end
