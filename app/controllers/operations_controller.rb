class OperationsController < ApplicationController
  def index
    @operations = Operation.all
  end

  def new
    @operation = current_user.operations.build
    @categories = current_user.categories
  end

  def create
    @operation = current_user.operations.build(operation_params)
    @categories = current_user.categories
    if @operation.save
      redirect_to "/operations"
    else
      puts @operation.errors.full_messages # <-- add this line
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, :category_id, :author_id)
  end
end
