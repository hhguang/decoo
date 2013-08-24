class GoodsStocksController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource :only=>[:lower_limit,:lower_limit_count]
  # GET /goods_stocks
  # GET /goods_stocks.json
  def index
    @search=params[:search] 
    if params[:search] and !params[:search].empty?
      w="bh like ? or name like ?","%#{params[:search]}%","%#{params[:search]}%"
    else
      w="1=1"
    end
    if params[:goods_category_id]
      w="goods_category_id = ? ",params[:goods_category_id]
    end
    @goods_stocks = GoodsStock.where(w).paginate(:page => params[:page], :per_page => 20).includes(:goods_category)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goods_stocks }
    end
  end

  def lower_limit_count
    
    render :text=>GoodsStock.lower_limit.size
  end

  def lower_limit
    @goods_stocks=GoodsStock.lower_limit
  end


  # GET /goods_stocks/1
  # GET /goods_stocks/1.json
  def show
    @goods_stock = GoodsStock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goods_stock }
      format.js
    end
  end

  # GET /goods_stocks/new
  # GET /goods_stocks/new.json
  def new
    @goods_stock = GoodsStock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goods_stock }
      format.js
    end
  end

  # GET /goods_stocks/1/edit
  def edit
    @goods_stock = GoodsStock.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goods_stock }
      format.js   { render :action=>"new"}
    end
  end

  # POST /goods_stocks
  # POST /goods_stocks.json
  def create
    @goods_stock = GoodsStock.new(params[:goods_stock])

    respond_to do |format|
      if @goods_stock.save
        format.html { redirect_to @goods_stock, notice: 'Goods stock was successfully created.' }
        format.json { render json: @goods_stock, status: :created, location: @goods_stock }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @goods_stock.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /goods_stocks/1
  # PUT /goods_stocks/1.json
  def update
    @goods_stock = GoodsStock.find(params[:id])

    respond_to do |format|
      if @goods_stock.update_attributes(params[:goods_stock])
        format.html { redirect_to @goods_stock, notice: 'Goods stock was successfully updated.' }
        format.json { head :no_content }
        format.js   
      else
        format.html { render action: "edit" }
        format.json { render json: @goods_stock.errors, status: :unprocessable_entity }
        format.js   
      end
    end
  end

  # DELETE /goods_stocks/1
  # DELETE /goods_stocks/1.json
  def destroy
    @goods_stock = GoodsStock.find(params[:id])
    @goods_stock.destroy

    respond_to do |format|
      format.html { redirect_to goods_stocks_url }
      format.json { head :no_content }
      format.js
    end
  end
end
