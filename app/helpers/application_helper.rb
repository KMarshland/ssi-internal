module ApplicationHelper

  def menu_item(name, path, extra_class='')
    is_current = current_page? path
    "<li class=\"#{is_current ? 'current_' : ''}page_item #{extra_class}\">#{link_to name, path}</li>".html_safe
  end

end
