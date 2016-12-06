module ApplicationHelper
  # def full_title(page_title="")
  #   base_title = "Co Corp Inc"
  #   sub_title = "Kickstarter prism direct trade"
  #   page_title.empty? ? base_title + ' | ' + sub_title : base_title + ' | ' + page_title
  # end
  def title(page_title="")
    content_for(:title) { page_title }
  end

  # using blocks in view
  def admin_area(&block)
    # check for condition; eg, if admin?
    if true
      # # using only concat
      # concat('<div class="admin">'.html_safe)
      # yield
      # concat('</div>'.html_safe)
      # using concat and capture, no need for yield
      concat content_tag :div, capture(&block), class: "admin"
    end
  end
end
