# encoding: utf-8
class ColorsController < ApplicationController
  # GET /colors
  # GET /colors.json
  def index
    w="1=1"
    o="id"
    @search=params[:search]
    if params[:search] and !params[:search].empty?
      w="name like ? or bh like ? ","%#{params[:search]}%","%#{params[:search]}%"    
    end
    @order=params[:order]
    if params[:order] and !params[:order].empty?
      o="#{params[:order]}"
    end
    @colors = Color.paginate(:page => params[:page], :per_page => 20).where(w).order(o)
    @color = Color.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colors }
    end
  end

  # GET /colors/1
  # GET /colors/1.json
  def show
    @color = Color.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @color }
    end
  end

  # GET /colors/new
  # GET /colors/new.json
  def new
    @color = Color.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @color }
    end
  end

  # GET /colors/1/edit
  def edit
    @color = Color.find(params[:id])
    
  end

  # POST /colors
  # POST /colors.json
  def create
    
    @color = Color.new(params[:color])

    respond_to do |format|
      if @color.save
        format.html { redirect_to colors_url, notice: 'Color was successfully created.' }
        format.json { render json: @color, status: :created, location: @color }
      else
        format.html { render action: "new" }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colors/1
  # PUT /colors/1.json
  def update
    @color = Color.find(params[:id])

    respond_to do |format|
      if @color.update_attributes(params[:color])
        format.html { redirect_to colors_url, notice: 'Color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1
  # DELETE /colors/1.json
  def destroy
    @color = Color.find(params[:id])
    begin
    @color.destroy
    flash[:notice]="数据已删除"
    rescue Exception=>e
      flash[:error]=e.message
    end
    respond_to do |format|
      format.html { redirect_to colors_url}
      format.json { head :no_content }
    end
  end
end
