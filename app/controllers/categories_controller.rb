class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
    @operations_by_category = {}
    @categories.each do |category|
      operations = Operation.where(category_id: category.id)
      @operations_by_category[category.id] = operations
    end

    @total_amount_by_category = {}
    @categories.each do |category|
      operations = @operations_by_category[category.id]
      @total_amount_by_category[category.name] = operations.sum(:amount)
    end
  end

  def show
    @category = Category.find(params[:id])
    @operations = Operation.where(category_id: @category.id)
    @total_amount = @operations.sum(:amount)
  end
end
