module ListsHelper

  protected

  def count_checked_items(list)
    raw("<span class=\"checked-items-count\">#{list.items.select(&:is_checked).count}</span> checked / <span class=\"total-items-count\">#{list.items.count}</span>")
  end

end
