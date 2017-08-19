module ApplicationHelper

  def map_for_object(obj, config={})
    defaults = {zoom: 16, scale: 1, width: 640, height: 420}
    center = "#{obj.latitude},#{obj.longitude}"
    query = defaults.merge config.merge center: center, key: ENV['GOOGLE_STATIC_MAP_KEY']
    query[:size] = "#{query[:width]}x#{query[:height]}"
    url = "https://maps.googleapis.com/maps/api/staticmap?#{query.to_query}&style=feature:poi.attraction|visibility:off&style=feature:poi.business|visibility:off&style=feature:poi.place_of_worship|visibility:off"

    "<img src=\"#{url}\" />".html_safe
  end

end
