class TransfersController < ApplicationController
  def new
    @transfer = Transfer.new
    @categories = Category.all
  end

  def create
    transfer = current_user.transfers.new(transfer_params)
    # transfer.category = Category.find(params[:category_id])
    # category = current_user.categories.find(params[:category_id])
    if transfer.save
      flash[:notice] = 'Category added successfully'
      redirect_to categories_path
      # redirect_to category_path(category.id)
    else
      flash.now[:error] = 'Error: Category could not be added'
      redirect_to new_category_transfers_path
    end
  end

  private

  def transfer_params
    params.require(:transfer).permit(:name, :amount, :category_id)
  end
end
