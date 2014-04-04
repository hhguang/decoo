class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    # user ||= User.new # in case of guest
#       if user.blank? || user.disabled?
#         # not logged in
#         cannot :manage, :all
# #        basic_read_only
#       elsif user.has_role?(:admin)
#         # admin
#         can :manage, :all
#       elsif user.has_role?(:warehouse_keeper)
#         can :read,Product
#         can :read,Color
#         can :read, Spec

#         can :manage,Stock
#         can :manage, InStockItem
#         can :manage, Outstock
#         can :manage, OutstockItem
#         can :out,Porder
#       elsif user.has_role?(:produce_manager)
#         can :read,Toy
#         can :manage,Porder
#         can :read,Stock
#         can :list,Stock
#         can :analysis,Stock
#         can :read,Product
#         can :read,Color
#         can :read, Spec
#         can :read, InStockItem
#         can :read, Outstock
#         can :read, OutstockItem
#         can :read, GoodsStock
#         can :read, GoodsStockItem
#       elsif user.has_role?(:goods_manager)
#         can :manage,GoodsStock
#         cannot :destroy,GoodsStock
#         can :manage,GoodsStockItem
#       else
#             cannot :manage,:all

#       end

    @user = user || User.new
    if user.roles.include? 'admin'
      can :manage, :all
    else
      user.permissions.each do |p|
        begin
          action = p.action.to_sym
          subject = begin
                        # RESTful Controllers
                        p.subject.camelize.constantize
                      rescue
                        # Non RESTful Controllers
                        p.subject.underscore.to_sym
                      end
                      can action, subject
        rescue => e
                      Rails.logger.info "#{e}"
                      Rails.logger.info "#{subject}"
        end
      end

    end
    # @user.roles.each { |role| send(role.name.downcase) }



    if @user.roles.size == 0
      cannot :manage,:all #for guest without roles
    end


  end

  def admin
    can :manage, :all
  end

  def warehouse_keeper
    can :read,Product
    can :read,Color
    can :read, Spec

    can :manage,Stock
    can :manage, InStockItem
    can :manage, Outstock
    can :manage, OutstockItem
    can :out,Porder
  end

  def produce_manager
    can :read,Toy
    can :manage,Porder
    can :read,Stock
    can :list,Stock
    can :analysis,Stock
    can :read,Product
    can :read,Color
    can :read, Spec
    can :read, InStockItem
    can :read, Outstock
    can :read, OutstockItem
    can :read, GoodsStock
    can :read, GoodsStockItem
  end

  def goods_manager
    can :manage,GoodsStock
    cannot :destroy,GoodsStock
    can :manage,GoodsStockItem
  end

  def product_goods_manager
    can :manage,ProductStock
    can :manage,Order
  end

end
