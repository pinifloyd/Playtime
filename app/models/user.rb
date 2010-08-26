class User < ActiveRecord::Base
  acts_as_authentic
  
  ROLES = %W[admin orders_operator]
    
end
