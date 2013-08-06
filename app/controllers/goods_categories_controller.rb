class GoodsCategoriesController < ApplicationController
  # GET /goods_categories
  # GET /goods_categories.json
  def index
    @goods_categories = GoodsCategory.all
    @goods_category = GoodsCategory.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goods_categories }
    end
  end

  # GET /goods_categories/1
  # GET /goods_categories/1.json
  def show
    @goods_category = GoodsCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goods_category }
    end
  end

  # GET /goods_categories/new
  # GET /goods_categories/new.json
  def new
    @goods_category = GoodsCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goods_category }
    end
  end

  # GET /goods_categories/1/edit
  def edit
    @goods_category = GoodsCategory.find(params[:id])
  end

  # POST /goods_categories
  # POST /goods_categories.json
  def create
    @goods_category = GoodsCategory.new(params[:goods_category])

    respond_to do |format|
      if @goods_category.save
        format.html { redirect_to @goods_category, notice: 'Goods category was successfully created.' }
        format.json { render json: @goods_category, status: :created, location: @goods_category }
      else
        format.html { render action: "new" }
        format.json { render json: @goods_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goods_categories/1
  # PUT /goods_categories/1.json
  def update
    @goods_category = GoodsCategory.find(params[:id])

    respond_to do |format|
      if @goods_category.update_attributes(params[:goods_category])
        format.html { redirect_to @goods_category, notice: 'Goods category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goods_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods_categories/1
  # DELETE /goods_categories/1.json
  def destroy
    @goods_category = GoodsCategory.find(params[:id])
    @goods_category.destroy

    respond_to do |format|
      format.html { redirect_to goods_categories_url }
      format.json { head :no_content }
    end
  end
end
