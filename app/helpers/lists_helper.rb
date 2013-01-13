module ListsHelper

  def count_checked_items(list)
    "#{list.items.map(&:is_checked).select{ |b| b == true }.count} checked / #{list.items.count}"
  end

end
