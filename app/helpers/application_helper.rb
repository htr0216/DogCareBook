module ApplicationHelper
  def navigation_item_class(controller, action = nil, except: nil)
    # コントローラ名が一致しない場合は、nilを返す。
    return nil unless params[:controller] == controller
    # アクションが指定されていて一致しない場合は、nilを返す。
    return nil if action != nil && params[:action] != action
    # アクション名が除外するものだった場合、nilを返す。
    return nil if params[:action] == except
    "active"
  end

  def hbr(target)
    target = html_escape(target)
    target = target.gsub(/\r\n|\r|\n/, "<br />")
    target.html_safe
  end
end
