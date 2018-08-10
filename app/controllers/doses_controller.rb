class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params["cocktail_id"])
  end

  def create
    # @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params["cocktail_id"])
    # @dose.cocktail = @cocktail
    @dose = @cocktail.doses.new(dose_params)
    # raise
    # @ingredient = Ingredient.find(dose_params["ingredient_id"])
    # @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    @cocktail = Cocktail.find(params[:cocktail_id])

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
