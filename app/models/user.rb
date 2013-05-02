class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me,:username,:name,:role_ids,:password_confirmation,:disabled
  attr_accessor :password_confirmation
  # attr_accessible :title, :body

  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :logs
  has_many :in_stock_items
  has_many :outstocks
  accepts_nested_attributes_for :roles

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def update_by_admin(params={})
    if params[:password].blank? && params[:pasword_comfirmateion].blank?
      self.update_without_password(params)
    else 
      self.update_attributes(params)
    end
  end

  
end
