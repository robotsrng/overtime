module ApplicationHelper
  def active?(path)
    return 'active' if current_page?(path)
  end

  def full_name

  end
end
