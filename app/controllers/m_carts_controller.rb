class MCartsController < ApplicationController
  # GET /m_carts
  # GET /m_carts.json
  def index
    @m_carts = MCart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @m_carts }
    end
  end

  # GET /m_carts/1
  # GET /m_carts/1.json
  def show
    @m_cart = MCart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @m_cart }
    end
  end

  # GET /m_carts/new
  # GET /m_carts/new.json
  def new
    @m_cart = MCart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @m_cart }
    end
  end

  # GET /m_carts/1/edit
  def edit
    @m_cart = MCart.find(params[:id])
  end

  # POST /m_carts
  # POST /m_carts.json
  def create
    @m_cart = MCart.new(params[:m_cart])

    respond_to do |format|
      if @m_cart.save
        format.html { redirect_to @m_cart, notice: 'M cart was successfully created.' }
        format.json { render json: @m_cart, status: :created, location: @m_cart }
      else
        format.html { render action: "new" }
        format.json { render json: @m_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /m_carts/1
  # PUT /m_carts/1.json
  def update
    @m_cart = MCart.find(params[:id])

    respond_to do |format|
      if @m_cart.update_attributes(params[:m_cart])
        format.html { redirect_to @m_cart, notice: 'M cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @m_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /m_carts/1
  # DELETE /m_carts/1.json
  def destroy
    @m_cart = MCart.find(params[:id])
    @m_cart.destroy

    respond_to do |format|
      format.html { redirect_to m_carts_url }
      format.json { head :no_content }
    end
  end
end
