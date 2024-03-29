
class Product < ActiveRecord::Base
   has_many :line_items
   before_destroy :ensure_not_referenced_by_any_line_item
   has_many :credit_items
   before_destroy :ensure_not_referenced_by_any_credit_item
  #...
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

   def ensure_not_referenced_by_any_credit_item
     if credit_items.empty?
       return true
     else
       errors.add(:base, 'Credit Items present')
       return false
     end
   end


  attr_accessible :description, :genre, :image_url, :price, :rating, :stock_status, :wanted, :title, :buy_price
  validates :description, :genre, :image_url, :price, :rating, :stock_status, :wanted,  :title, :presence => true
  validates :buy_price, :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
           :with => %r{\.(gif|jpg|png)$}i,
           :message => ' image must be JPG,GIF or PNG'
  }
end
