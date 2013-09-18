class StocksController < ApplicationController
  load_and_authorize_resource
   skip_load_and_authorize_resource :only=>[:low_count,:low_list]
  skip_filter :log,:only=>[:low_count,:low_list]
  # GET /stocks
  # GET /stocks.json
  def index
    @search=params[:search]
    w="1=1"
    if params[:search] and !params[:search].empty?
      w="name like ? or bh like ? or color_name like ?","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%"
    end
    @stocks = Stock.paginate(:page => params[:page], :per_page => 10).where(w).order("bh")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stocks }
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock }
    end
  end

  # GET /stocks/new
  # GET /stocks/new.json
  def new
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock }
    end
  end

  # GET /stocks/1/edit
  def edit
    @stock = Stock.find(params[:id])
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(params[:stock])

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render json: @stock, status: :created, location: @stock }
      else
        format.html { render action: "new" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stocks/1
  # PUT /stocks/1.json
  def update
    @stock = Stock.find(params[:id])

    respond_to do |format|
      if @stock.update_attributes(params[:stock])
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to stocks_url }
      format.json { head :no_content }
    end
  end

  def list
    @stock=Stock.find(params[:id])
    @instock_items=@stock.spec.in_stock_items.order('created_at desc')
    @outstock_items=@stock.spec.outstock_items.order('created_at desc')
  end

  def analysis
    @items=[]
    Porder.wait_for_out.each do |list| 
      @items+=list.porder_items 
    end
    arr=[]
    groups=@items.group_by{ |item| item.spec || item.part.spec }
      
    groups.each do |key,value| 
      hash={}
      hash[:spec]=key
      hash[:id]=key.id
      hash[:bh]=key.bh
      hash[:wait_for_out]=value.sum{|t| t.quantity }
      hash[:stock_quantity]=key.stock ? key.stock.quantity : 0
      hash[:stock_left]=hash[:stock_quantity]-hash[:wait_for_out]
      arr<<hash
    end
    @wait_items=arr.sort_by!{|a|a[:stock_left]}
  end

  def in_out_query
    @act=params[:act]
    if params[:search] && !params[:search].empty?
      bh='spec_bh= ? ', params[:search]
    else
      bh='1=1'
    end
    if @act
      if params[:act]=='in'
        record=InStockItem.where("created_at > ? and created_at< ?",params[:start],params[:end]).where(bh)
        @weight=record.sum(:weight)
      else
        record=OutstockItem.where("created_at > ? and created_at< ?",params[:start],params[:end]).where(bh)
        @weight=record.sum(:weight)
      end
      @quantity=record.sum{|r| r.quantity}
    end

  end

  def low_count
    render :text=>Stock.lower.size
    rescue
      render :text=>Stock.lower.size
  end

  def low_list
    @stocks=Stock.lower
  end

end
