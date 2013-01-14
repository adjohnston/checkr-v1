class ListsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :edit]
  before_filter :find_list, only: [:edit, :update, :destroy]

  def find_list
    @list = current_user.lists.find(params[:id])
  end

  def index
    @lists = user_signed_in? ? current_user.lists : User.find_by_username(params[:username]).lists.find_by_is_public(true)
  end

  def show
    @list = user_signed_in? ? current_user.lists.find(params[:id]) : User.find_by_username(params[:username]).lists.where('id = ? AND is_public = true', params[:id])
    @items = @list.items.all
    @item = @list.items.new
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(params[:list])

    if @list.save
      redirect_to list_path(@list.id), notice: "#{@list.name} has been created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update_attributes(params[:list])
      redirect_to lists_path(@list.id), notice: "#{@list.name} has been updated"
    else
      render :edit
    end
  end

  def destroy
    @list.delete
    redirect_to lists_path, notice: 'Your list has been deleted'
  end

end
