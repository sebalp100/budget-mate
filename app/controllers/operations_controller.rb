class OperationsController < ApplicationController
  def index
    @operations = Operation.all
  end

  def new
    @operation = Operation.new
    @categories = current_user.categories
  end

  def create
    @operation = current_user.authored_operations.build(operation_params)
  
    if @operation.save
      redirect_to category_operations_path(@operation.categories.first), notice: "Operation created."
    else
      @categories = current_user.categories
      render :new
    end
  end
  
  private
  
  def operation_params
    params.require(:operation).permit(:name, :amount, category_id: [])
  end
end
