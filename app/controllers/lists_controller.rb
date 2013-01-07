class ListsController < ApplicationController

  def index
    debugger
    @lists = current_user ? current_user.lists : User.find_by_username(params[:username]).lists.find_by_is_public(true)
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(params[:list])

    if @list.save
      redirect_to list_path(@list.id), notice: 'Your new list has been created'
    else
      render :new
    end
  end

  def destroy
    @list = current_user.lists.find(:id)
    @list.delete
    redirect_to lists_path, notice: 'Your list has been deleted'
  end

end
