class PalindromeController < ApplicationController


  def show
  end

  def calculate
    @number = params[:number].to_i

    palindrome_svc = PalindromeService.new

    begin
      @result = palindrome_svc.nearest_palindrome(@number)
    rescue PalindromeService::NotANumber => e
      flash.now[:error] = e.message
    rescue PalindromeService::NegativeValue => e
      flash.now[:error] = e.message
    end

    render :show
  end
end
