class PortfolioItemsController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  def search
    @portfolio_item = PortfolioItem.new
    @search = PortfolioSearchForm.new(params[:portfolio_search_form])
    @colors = @search.colors_by_hsl
    @portfolio_items = @colors.collect(&:portfolio_items).flatten.uniq
    render :index
  end

  # GET /portfolio_items
  # GET /portfolio_items.json
  def index
    @search = PortfolioSearchForm.new
    @portfolio_item = PortfolioItem.new
    @portfolio_items = PortfolioItem.all
  end

  # GET /portfolio_items/1
  # GET /portfolio_items/1.json
  def show
  end

  # GET /portfolio_items/new
  def new
    @portfolio_item = PortfolioItem.new
  end

  # GET /portfolio_items/1/edit
  def edit
  end

  # POST /portfolio_items
  # POST /portfolio_items.json
  def create
    @portfolio_item = PortfolioItem.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item, notice: 'Portfolio item was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_items/1
  # PATCH/PUT /portfolio_items/1.json
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to @portfolio_item, notice: 'Portfolio item was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_items/1
  # DELETE /portfolio_items/1.json
  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_items_url, notice: 'Portfolio item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio_item
    @portfolio_item = PortfolioItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_item_params
    params.require(:portfolio_item).permit :image, :color_count
  end
end
