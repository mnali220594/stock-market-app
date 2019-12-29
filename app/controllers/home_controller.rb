class HomeController < ApplicationController
  def index
    @api_key = StockQuote::Stock.new(api_key: ENV['IEX_API_KEY'])

    
    if params[:ticker] == ''
      @nothing = 'Please type in the company you want to search for'
    elsif params[:ticker]
      
      begin
        @stock = StockQuote::Stock.quote(params[:ticker])  
      rescue => exception
        @error =  'No company name found'
      end

    end      
  end
end
