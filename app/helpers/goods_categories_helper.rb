# encoding: utf-8
module GoodsCategoriesHelper
	def tree_show(node)
		html=%{				
				#{node.name}
				
				#{link_to '编辑', edit_goods_category_path(node)}
				#{link_to '删除', node,confirm: '确定要删除吗？', method: :delete }
				#{link_to '新建子分类', new_child_goods_category_path(node)}
				
			}
		if node.children.size>0
			html+="<ul>"
			node.children.each do |category|
				html+="<li>#{tree_show(category)}</li>"
				
			end
			html+="</ul>"
		end
		return html.html_safe  
	end
end
