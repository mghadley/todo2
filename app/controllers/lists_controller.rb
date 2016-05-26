class ListsController < ApplicationController
  def index
  	@lists = List.all
  end

  def show
  	@list = List.find(params[:id])
  end

  def new
  	@list = List.new
  end

  def create
    @list = List.new(list_params)
  	if @list.save
  		redirect_to list_path(@list)
  	else
  		render :new
  	end
  end

  def edit
  	@list = List.find(params[:id])
  end

  def update
  	List.find(params[:id]).update(list_params)
  end

  def destroy
  	List.find(params[:id]).destroy
  	redirect_to lists_path
  end

  private

  def list_params
  	params.require(:list).permit(:name)
  end
end
