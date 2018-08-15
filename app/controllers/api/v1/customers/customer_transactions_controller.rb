class Api::V1::Customers::CustomerTransactionsController < ApplicationController

  def index
    render json: Customer.includes(:invoices, :transactions).find(params[:customer_id]).transactions
  end

end
