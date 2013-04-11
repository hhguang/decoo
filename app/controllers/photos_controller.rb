# coding: utf-8
class PhotosController < ApplicationController
  
 @@storage_path =  "#{Rails.root}/public/products"
  def create
    # 浮动窗口上传
    
    image_url=uploadFile(params[:Filedata])
    render :text => image_url
  end

  protected

  def uploadFile(file)
    if !file.original_filename.empty?
      @filename=getFileName(file.original_filename)
      File.open("#{Rails.root}/public/products/#{@filename}", "wb") do |f|
      f.write(file.read)
      end
      return @filename
    end
  end

  def getFileName(filename)

    timestamp = DateTime.now.strftime("%y%m%d%H%M%S")
    ascii = ''
    if filename =~ %r{^[a-zA-Z0-9_\.\-]*$}
      ascii = filename
    else
      ascii = Digest::MD5.hexdigest(filename)
      # keep the extension if any
      ascii << $1 if filename =~ %r{(\.[a-zA-Z0-9]+)$}
    end
    while File.exist?(File.join(@@storage_path, "#{timestamp}_#{ascii}"))
      timestamp.succ!
    end
    "#{timestamp}_#{ascii}"
  end
end
