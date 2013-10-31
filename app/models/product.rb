class Product < ActiveRecord::Base
  attr_accessible :description, :imae_url, :price, :title
   validates_uniqueness_of :title
   validates_presence_of :title, :description, :imae_url
   validates_numericality_of :price, :greater_than_or_equal_to => 0.01
   validates_format_of :imae_url,
                       :with => %r{\.(gif|png|jpg)$}i,
                       :message => "must be a URL for a GIF,JPG,PNG image."
end
