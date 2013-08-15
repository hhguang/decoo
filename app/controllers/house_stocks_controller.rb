class HouseStocksController < ApplicationController
  # GET /house_stocks
  # GET /house_stocks.json
  def index
    @house_stocks = HouseStock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @house_stocks }
    end
  end

  # GET /house_stocks/1
  # GET /house_stocks/1.json
  def show
    @house_stock = HouseStock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house_stock }
    end
  end

  # GET /house_stocks/new
  # GET /house_stocks/new.json
  def new
    @house_stock = HouseStock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house_stock }
    end
  end

  # GET /house_stocks/1/edit
  def edit
    @house_stock = HouseStock.find(params[:id])
  end

  # POST /house_stocks
  # POST /house_stocks.json
  def create
    @house_stock = HouseStock.new(params[:house_stock])

    respond_to do |format|
      if @house_stock.save
        format.html { redirect_to @house_stock, notice: 'House stock was successfully created.' }
        format.json { render json: @house_stock, status: :created, location: @house_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @house_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /house_stocks/1
  # PUT /house_stocks/1.json
  def update
    @house_stock = HouseStock.find(params[:id])

    respond_to do |format|
      if @house_stock.update_attributes(params[:house_stock])
        format.html { redirect_to @house_stock, notice: 'House stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /house_stocks/1
  # DELETE /house_stocks/1.json
  def destroy
    @house_stock = HouseStock.find(params[:id])
    @house_stock.destroy

    respond_to do |format|
      format.html { redirect_to house_stocks_url }
      format.json { head :no_content }
    end
  end
end
