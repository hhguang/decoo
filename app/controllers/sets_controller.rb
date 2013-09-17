# encoding: utf-8
class SetsController < ApplicationController
  def index
  	@sets=Sets.stock_lower_warning 
  end

  def stock_lower_warning
  	@Stocklowerwarning=Sets.stock_lower_warning 
  end

  def update
  	@sets=Sets.find(params[:id])  	

    respond_to do |format|
      if @sets.update_attributes(params[:sets])
      	flash[:notice]="设置成功"
        format.html { redirect_to :action=>'index' }
        format.json { head :no_content }
      else
        format.html { redirect_to :action=>'index' }
        format.json { render json: @sets.errors, status: :unprocessable_entity }
      end
    end
  end
end
