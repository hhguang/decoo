# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_role=Role.create(name: 'admin',title: '管理员')
Role.create(name: 'warehouse_keeper',title: '仓库管理员')
Role.create(name: 'produce_manager',title: '生产管理员')
admin=User.create(name: 'admin', username: 'admin', password: "123456",password_confirmation: '123456', email: 'admin@decool.net')
admin.roles<<admin_role