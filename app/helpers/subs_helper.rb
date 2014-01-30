module SubsHelper

  def remove_nil(links)
    links.reject{ |link| link["title"].empty? || link["url"].empty? }
  end
end
