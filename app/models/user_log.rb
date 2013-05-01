# encoding: utf-8
class UserLog < ActiveRecord::Base
  attr_accessible :action_name, :ctr_name, :description, :resource_id, :resource_name, :user_id,:url,:remote_ip

  belongs_to :user

  ACTIONS={
  	'index'=>'列表',
  	'show'=>'查看',
  	'edit'=>'编辑',
  	'new'=>'添加',
  	'create'=>'创建',
  	'update'=>'更新',
  	'destroy'=>'删除'
  }
end
