module ApplicationHelper
  
  #税込金額の計算
  def tax(price)
    (price * 1.10).round
  end
  
  #合計金額の計算（税込）
  def sum_total_price(price, amount)
    (price * 1.10).round * amount
  end
  
end
