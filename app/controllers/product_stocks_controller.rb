class ProductStocksController < ApplicationController
	def index
		@search=params[:search] 
	    if params[:search] and !params[:search].empty?
	      w="bh like ? or name like ?","%#{params[:search]}%","%#{params[:search]}%"
	    else
	      w="1=1"
	    end    
	    
	    @goods_stocks = ProductStock.where(w).paginate(:page => params[:page], :per_page => 20).includes(:goods_category).order("bh+0")

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @goods_stocks }
	    end
	end
end
