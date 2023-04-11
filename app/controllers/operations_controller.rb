class OperationsController < ApplicationController
  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @operations = @category.operations.where(author: current_user)
    else
      @operations = current_user.operations
    end
  end

  def new
    @operation = current_user.operations.build
    @categories = current_user.categories
    @selected_category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  def create
    @operation = current_user.operations.build(operation_params)
    @categories = current_user.categories
    if @operation.save
      redirect_to operations_path(category_id: @operation.category_id)
    else
      puts @operation.errors.full_messages
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, :category_id, :author_id)
  end
end
