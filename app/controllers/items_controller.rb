class ItemsController < ApplicationController

  def create
    @item = current_user.lists.find(params[:list_id]).items.new(params[:item])

    if @item.save
      redirect_to list_path(@item.list_id), notice: "#{@item.name} has been added"
    else
      render 'lists/show'
    end
  end

  def update
    @item = current_user.lists.find(params[:list_id]).items.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to list_path(@item.list_id), notice: "#{@item.name} checked"
    else
      render 'lists/show'
    end
  end

end
