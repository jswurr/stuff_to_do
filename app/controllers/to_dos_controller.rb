class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all
  end

  def create
    @to_do = ToDo.new(todo_params)
    respond_to do |format|
      if @to_do.save
        format.html { redirect_to root_url }
        format.js
      else
        format.html { redirect_to root_url, notice: 'Your to-do item was invalid'}
      end
    end

  end

  def destroy
    @to_do = ToDo.find(params[:id])
    @to_do.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
    @to_do = ToDo.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

    def todo_params
      params.require(:to_do).permit(:desc)
    end
end
