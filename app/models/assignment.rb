# To change this template, choose Tools | Templates
# and open the template in the editor.

class Assignment < ActiveRecord::Base

  belongs_to :user
  belongs_to :role
end
