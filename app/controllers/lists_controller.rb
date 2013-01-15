class ListsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :edit]
  before_filter :find_list, only: [:edit, :update, :destroy]

  def find_list
    @list = current_user.lists.find(params[:id])
  end

  def index
    @lists = user_signed_in? ? current_user.lists : User.where(username: params[:username]).first.lists.where(is_public: true)
  end

  def show
    @list = user_signed_in? ? current_user.lists.find(params[:id]) : User.where(username: params[:username]).first
                                                                     .lists.where(name: params[:name].gsub('-', ' ')).first
    @items = @list.items.all(order: :created_at)
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
