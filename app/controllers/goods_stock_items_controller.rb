class GoodsStockItemsController < ApplicationController
  # GET /goods_stock_items
  # GET /goods_stock_items.json
  def index
    @goods_stock_items = GoodsStockItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goods_stock_items }
    end
  end

  # GET /goods_stock_items/1
  # GET /goods_stock_items/1.json
  def show
    @goods_stock_item = GoodsStockItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goods_stock_item }
    end
  end

  # GET /goods_stock_items/new
  # GET /goods_stock_items/new.json
  def new
    @type=params[:type] || "in"
    @goods=GoodsStock.find(params[:id])
    @goods_stock_item = GoodsStockItem.new(:goods_stock_id=>@goods.id,:type=>@type)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goods_stock_item }
    end
  end

  def in
    @type= "in"
    @goods=GoodsStock.find(params[:goods_stock_id])
    @goods_stock_item = GoodsStockItem.new(:goods_stock_id=>@goods.id,:act_type=>@type)

    respond_to do |format|
      format.html {render :action=>'new'}
      format.json { render json: @goods_stock_item }
      format.js
    end
  end

  def out
    @type= "out"
    @goods=GoodsStock.find(params[:goods_stock_id])
    @goods_stock_item = GoodsStockItem.new(:goods_stock_id=>@goods.id,:act_type=>@type)

    respond_to do |format|
      format.html {render :action=>'new'}
      format.json { render json: @goods_stock_item }
      format.js   {render :action=>'in'}
    end
  end

  # GET /goods_stock_items/1/edit
  def edit
    @goods_stock_item = GoodsStockItem.find(params[:id])
  end

  # POST /goods_stock_items
  # POST /goods_stock_items.json
  def create
    @goods_stock_item=GoodsStockItem.new(params[:goods_stock_item])
    if @goods_stock_item.act_type=="in"
      GoodsStockItem.in(@goods_stock_item)
    else
      GoodsStockItem.out(@goods_stock_item)
    end

    respond_to do |format|
    
        format.html { redirect_to :aciton=>'index', notice: 'Goods stock item was successfully created.' }
        format.json { render json: @goods_stock_item, status: :created, location: @goods_stock_item }
        format.js
    end
  rescue
    respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @goods_stock_item.errors, status: :unprocessable_entity }
        format.js   
    end
  end

  # PUT /goods_stock_items/1
  # PUT /goods_stock_items/1.json
  def update
    @goods_stock_item = GoodsStockItem.find(params[:id])

    respond_to do |format|
      if @goods_stock_item.update_attributes(params[:goods_stock_item])
        format.html { redirect_to @goods_stock_item, notice: 'Goods stock item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goods_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods_stock_items/1
  # DELETE /goods_stock_items/1.json
  def destroy
    @goods_stock_item = GoodsStockItem.find(params[:id])
    @goods_stock_item.destroy

    respond_to do |format|
      format.html { redirect_to goods_stock_items_url }
      format.json { head :no_content }
    end
  end
end
