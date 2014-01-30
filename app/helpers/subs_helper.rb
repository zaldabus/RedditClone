module SubsHelper

  def remove_nil(links)
    links.reject{ |link| link["title"].empty? || link["url"].empty? }
  end

  def mod_only(sub)
    redirect_to sub_url(sub) unless current_user.id == sub.mod_id
  end
end
