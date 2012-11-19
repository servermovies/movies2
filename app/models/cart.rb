class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy
  has_many :credit_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end


  def add_credit(product_id)
    latest_item = credit_items.find_by_product_id(product_id)
    if latest_item
      latest_item.quantity += 1
    else
      latest_item = credit_items.build(product_id: product_id)
    end
    latest_item
  end

  def total_credit
    credit_items.to_a.sum { |credit| credit.total_credit}
  end
end
