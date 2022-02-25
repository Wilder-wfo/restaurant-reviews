class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # what happen if save doesn't work?, when review.save desn't save, the answer is =>false
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # With redirect_to reinicia todos los campos vuelve a empezar el request, para usar los
      # parámetros ya enviados se DEBE volver a usar
      # xxx redirect_to new_restaurant_review_path(@restaurant)
      render :new  # Asume se le pasa un Review.new, pero con parámetros, se queda en la misma acción
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy                                 # Although we DELETE the review from DB, 
    redirect_to restaurant_path(@review.restaurant) # we can access the deleted instance of that review
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
