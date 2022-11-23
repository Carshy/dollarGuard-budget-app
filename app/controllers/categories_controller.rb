class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      flash[:success] = 'Category Added Successfully'
      redirect_to new_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :amount, :icon)
  end
end
