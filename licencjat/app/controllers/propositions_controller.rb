class PropositionsController < ApplicationController
  before_action :cat
  def new
    @proposition = Proposition.new
  end

  def create
    begin
      @proposition = Proposition.new(params[:propositions])
      @proposition.request = request
      if @proposition.deliver
        flash.now[:notice] = 'Dziękuję za zaproponowanie nowej atrakcji!'
      else
        flash.now[:error] = 'Przykro mi, wiadomość nie może zostać dostarczona.'
        render :new
      end #rescue
          #ScriptError flash[:error] = 'Przykro mi, wiadomość nie może zostać dostarczona.'
    end
  end

  def cat
    @categories = Category.all
  end

end