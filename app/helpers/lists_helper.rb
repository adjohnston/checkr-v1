module ListsHelper

  def count_checked_items(list)
    "#{list.items.select(&:is_checked).count} checked / #{list.items.count}"
  end

end
