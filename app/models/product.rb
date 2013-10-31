class Product < ActiveRecord::Base
    attr_accessible :description, :imae_url, :price, :title, :product_id  
   # attr_accessible :description, :imae_url, :price, :title, :product
    default_scope :order => 'title'
    has_many :line_items
    before_destroy :ensure_not_referenced_by_any_line_item

   private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

   validates_length_of :title, :minimum => 4
   attr_accessible :description, :imae_url, :price, :title
   validates_uniqueness_of :title
   validates_presence_of :title, :description, :imae_url
   validates_numericality_of :price, :greater_than_or_equal_to => 0.01
   validates_format_of :imae_url,
                       :with => %r{\.(gif|png|jpg)$}i,
                       :message => "must be a URL for a GIF,JPG,PNG image."
end
