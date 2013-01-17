class ItemsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :edit, :destroy]

  def new
    @list = List.find(params[:list_id])
    @item = @list.items.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(params[:item])

    if @item.save
      redirect_to list_path(@item.list_id), notice: "#{@item.name} has been added"
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
  end

  def update
    @item = current_user.lists.find(params[:list_id]).items.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to list_path(@item.list_id), notice: "#{@item.name} updated"
    else
      render :edit
    end
  end

  def update_checkbox
    @item = User.find(params[:user]).lists.find(params[:list]).items.find(params[:id])
    list_name = List.find(@item.list_id).name.gsub(' ', '-')
    username = User.find(params[:user]).username

    if @item.update_attributes(params[:item])
      redirect_to user_signed_in? ? list_path(@item.list_id) : user_list_path(username, list_name)
    else
      redirect_to user_signed_in? ? list_path(@item.list_id) : user_list_path(username, list_name), 
        alert: 'There was an error, please try again later'
    end
  end

  def destroy
    @item = current_user.lists.find(params[:list_id]).items.find(params[:id])
    redirect_to list_item_path(@item.list_id, @item.id), notice: 'Your item was deleted' if @item.delete
  end

end
