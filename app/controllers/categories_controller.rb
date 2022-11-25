class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def show
    @category = Category.find(params[:id])
    @transfers = Transfer.includes(:category).all.where(category_id: @category.id)
    # @transfers = @category.transfers.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      flash[:success] = 'Category Added Successfully'
      redirect_to categories_path
    else
      flash.now[:error] = 'Error: Category could not be added'
      redirect_to new_category_path
    end
  end

  def destroy
    Category.find(params[:id]).delete
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
