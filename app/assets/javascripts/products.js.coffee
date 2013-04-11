# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.Products =
  # 往话题编辑器里面插入图片代码
  appendImageFromUpload : (srcs) ->
    $('#product-image').attr("src","/products/"+srcs)
    $('#image-url').attr("value",srcs)
    console.log(srcs)

  # 上传图片
  initUploader : () ->
    $("#topic_add_image").bind "click", () ->
      $("#topic_upload_images").click()
      return false

    opts =
      url : "/photos"
      type : "POST"
      beforeSend : () ->
        $("#topic_add_image").hide()
        $("#topic_add_image").before("<span class='loading'>上传中...</span>")
      success : (result, status, xhr) ->
        $("#topic_add_image").parent().find("span").remove()
        $("#topic_add_image").show()
        Products.appendImageFromUpload([result])

    $("#topic_upload_images").fileUpload opts
    return false

# pages ready
$(document).ready ->

  Products.initUploader()