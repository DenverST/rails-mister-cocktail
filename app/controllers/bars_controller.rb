class BarsController < ApplicationController

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      redirect_to bar_path(@bar)
    else
      render :new
    end
  end

  def bar_params
    params.require(:bar).permit(:name)
  end

end
