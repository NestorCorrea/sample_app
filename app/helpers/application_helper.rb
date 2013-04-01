module ApplicationHelper
  # Returns the the full title for pages
  def full_title(page_title)
    base_title = "Ruby on Rails Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def copyright_text ()
    "#{Time.now.year} all rights reserved is the bomb, fo shizzel"
  end
end
