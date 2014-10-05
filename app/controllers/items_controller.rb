class ItemsController < ApplicationController

  def index
    if params[:search]
      @items = Item.where("title like ? ", "%#{params[:search]}%")
    else
      @items = Item.all
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      # redirect_to item_path(@item.id)
      redirect_to @item  #redirect to show action
      flash[:success] = "Item #{@item.title} created!"
    else
      flash[:danger] = "Please fix the errors"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to @item
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
    flash[:success] = "Item was deleted"
  end

  private

  def items_params
    params.require(:item).permit(:title, :description, :ranking, :status)
  end

end
