class ItemsController < ApplicationController
  def index
  	@items_outstanding = Item.where(completed: false).order(priority: :desc)
  	@items_completed = Item.where(completed: true).order(priority: :desc)
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  	@list = List.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update(item_params)
			redirect_to item_path(@item)
  	else
  		render :edit
  	end
  end

  def create
  	if Item.create(item_params)
  		redirect_to list_path(item_params[:list_id])
  	else
  		render :new
  	end
  end

  def destroy
  	@list = List.find(Item.find(params[:id]).list_id)
  	Item.find(params[:id]).destroy
  	redirect_to list_path(@list)
  end

  private

  def item_params
  	params.require(:item).permit(:name, :description, :priority, :list_id, :completed)
  end
end
