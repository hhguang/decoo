class ProductStocksController < ApplicationController
	def index
		@search=params[:search] 
	    if params[:search] and !params[:search].empty?
	      w="bh like ? or name like ? or memo like ? ","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%"
	    else
	      w="1=1"
	    end    
	    
	    @goods_stocks = ProductStock.where(w).paginate(:page => params[:page], :per_page => 20).includes(:goods_category).order("bh+0")

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @goods_stocks }
	    end
	end

	def show
	    @goods_stock = ProductStock.find(params[:id])

	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @goods_stock }
	      format.js
	    end
	end

	def new
	    @goods_stock = ProductStock.new

	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @goods_stock }
	      format.js
	    end
	end

	
	def edit
	    @goods_stock = ProductStock.find(params[:id])
	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @goods_stock }
	      format.js   { render :action=>"new"}
	    end
	end

	def create
	    @goods_stock = ProductStock.new(params[:product_stock])

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

	def update
	    @goods_stock = ProductStock.find(params[:id])

	    respond_to do |format|
	      if @goods_stock.update_attributes(params[:product_stock])
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

	def destroy
	    @goods_stock = ProductStock.find(params[:id])
	    @goods_stock.destroy

	    respond_to do |format|
	      format.html { redirect_to product_stocks_url }
	      format.json { head :no_content }
	      format.js
	    end
	end
end
