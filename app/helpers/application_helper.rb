module ApplicationHelper
  # def full_title(page_title="")
  #   base_title = "Co Corp Inc"
  #   sub_title = "Kickstarter prism direct trade"
  #   page_title.empty? ? base_title + ' | ' + sub_title : base_title + ' | ' + page_title
  # end
  def title(page_title="")
    content_for(:title) { page_title }
  end
end
