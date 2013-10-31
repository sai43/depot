class Product < ActiveRecord::Base
  attr_accessible :description, :imae_url, :price, :title
end
