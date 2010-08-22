class UserMailer < ActionMailer::Base
  def email_with_order(order, cart)
    recipients order.email
    from "sergey@admin.com"
    subject "Your order"
    sent_on Time.now
    body ({:order => order, :cart => cart})
  end
end