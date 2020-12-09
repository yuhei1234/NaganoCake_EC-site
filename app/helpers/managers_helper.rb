module ManagersHelper
  def name(customer)
    customer.last_name + customer.first_name
  end
  
  def name_kana(customer)
    customer.last_name_kana + customer.first_name_kana
  end

end
