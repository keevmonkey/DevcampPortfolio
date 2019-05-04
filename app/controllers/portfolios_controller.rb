class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def angular_items
    @portfolio_angular_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio Item created successfully" }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to @portfolio_item, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Porfolio item was successfully destroyed.' }
    end
  end

  private

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
