# encoding: utf-8
class MListsController < ApplicationController
  # GET /m_lists
  # GET /m_lists.json
  def index
    if params[:search] 
      @search=params[:search]
      @m_lists=MList.where('name like ? ',"%"+params[:search]+"%").paginate(:page => params[:page], :per_page => 10).order('updated_at desc')
    else
      @m_lists = MList.paginate(:page => params[:page], :per_page => 10).order('updated_at desc')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @m_lists }
    end
  end

  # GET /m_lists/1
  # GET /m_lists/1.json
  def show
    @m_list = MList.find(params[:id])
    @modules={}
    @m_list.m_items.each do |item|
      toy=item.toy
      toy.parts.each do |part|
        spec=part.spec
        product=spec.product
        @modules[product]={}  if !@modules[product]
        @modules[product][spec]=0 if !@modules[product][spec]
        @modules[product][spec]+=part.quantity*item.quantity
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @m_list }
      format.xls
    end
  end

  # GET /m_lists/new
  # GET /m_lists/new.json
  def new
    @m_cart = current_cart
    @m_items=@m_cart.m_items
    if params[:search] 
          @toys=Toy.where('name like ?',"%"+params[:search]+"%").paginate(:page => params[:page], :per_page => 16).order('name+0')
    else
         @toys = Toy.paginate(:page => params[:page], :per_page => 16).order("name+0")
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @m_list }
    end
  end

  def add_item
    @m_cart = current_cart
    @m_item=@m_cart.m_items.build(params[:m_item])
    respond_to do |format|
      if @m_item.save
        format.html { redirect_to action: "new", notice: 'M list was successfully created.' }
        format.json { render json: @m_list, status: :created, location: @m_list }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @m_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def clear_cart
    @m_cart = current_cart
    @m_cart.m_items.clear
    respond_to do |format|
      format.js 
    end
  end

  def remove_item
    @m_cart = current_cart
    @m_item=MItem.find(params[:m_item_id])
    @m_cart.m_items.delete(@m_item)
    respond_to do |format|
      format.js 
    end
  end

  # GET /m_lists/1/edit
  def edit
    @m_list = MList.find(params[:id])
  end

  # POST /m_lists
  # POST /m_lists.json
  def create
    @m_list = MList.new(:name=>"m"+Time.now.strftime("%Y%m%d%H%M%S "))
    current_cart.m_items.each do |item|
      item.m_cart_id=nil
      @m_list.m_items<<item
    end

    respond_to do |format|
      if @m_list.save
        MCart.destroy(session[:m_cart_id])
        session[:m_cart_id]=nil
        format.html { redirect_to @m_list, notice: '布产单已成功创建.' }
        format.json { render json: @m_list, status: :created, location: @m_list }
      else
        format.html { render action: "new" }
        format.json { render json: @m_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /m_lists/1
  # PUT /m_lists/1.json
  def update
    @m_list = MList.find(params[:id])

    respond_to do |format|
      if @m_list.update_attributes(params[:m_list])
        format.html { redirect_to @m_list, notice: 'M list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @m_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /m_lists/1
  # DELETE /m_lists/1.json
  def destroy
    @m_list = MList.find(params[:id])
    @m_list.destroy

    respond_to do |format|
      format.html { redirect_to m_lists_url }
      format.json { head :no_content }
    end
  end
end
