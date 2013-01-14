class ItemsController < ApplicationController

  def create
    @item = current_user.lists.find(params[:list_id]).items.new(params[:item])

    if @item.save
      redirect_to list_path(@item.list_id), notice: "#{@item.name} has been added"
    else
      render 'lists/show'
    end
  end

  # this needs sorting out as public can update the checkbox only. Probably needs to be sectioned off in its own method
  def update
    @item ||= nil

    if user_signed_in?
      @item = current_user.lists.find(params[:list_id]).items.find(params[:id]) 
    else
      @item = List.find(params[:list_id]).items.find(params[:id])
    end

    if @item.update_attributes(params[:item])
      redirect_to list_path(@item.list_id), notice: "#{@item.name} checked"
    else
      render 'lists/show'
    end
  end

end
