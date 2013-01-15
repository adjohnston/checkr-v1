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
      redirect_to list_path(@item.list_id), notice: "#{@item.name} updated"
    else
      render 'lists/show'
    end
  end

  def update_checkbox
    @item = User.find(params[:user]).lists.find(params[:list]).items.find(params[:id])
    @username = User.find(params[:user]).username

    if @item.update_attributes(params[:item])
      redirect_to user_signed_in? ? list_path(@item.list_id) : user_list_path(@username, @item.list_id)
    else
      redirect_to user_signed_in? ? list_path(@item.list_id) : user_list_path(@username, @item.list_id), 
                  alert: 'There was an error, please try again later'
    end
  end

end
