class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTH_USER"], password: ENV["HTTP_BASIC_AUTH_PASS"]

  def show
    @productcount = Product.count
    @categorycount = Category.count
  end
end
