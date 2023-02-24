# ./amazon_order.rb
require './lib/online_order'
class AmazonOrder
  include OnlineOrder

  # attr_reader :type,
  #             :time

  # def initialize
  #   @type = 'order'
  #   @time = '2 business days'
  # end

  # ^^^ could add this to module since we have it in both classes

  # def delivery
  #   "Your order will arrive in 2 business days."
  # end
end
