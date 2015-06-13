class PropositionsController < ApplicationController
  before_action :cat
  respond_to :html, :js
  def index

  end
  def new
    @proposition = Proposition.new(proposition_params)

  end

  def create
    begin
      @proposition = Proposition.new(params[:proposition])
      @proposition.request = request

      if @proposition.deliver
        flash.now[:notice] = 'Dziękuję za zaproponowanie nowej atrakcji!'
        redirect_to 'propositions#show'
      else
        flash.now[:error] = 'Przykro mi, wiadomość nie może zostać dostarczona.'
        #render :new
        redirect_to 'error#not_found'
      end #rescue
          #ScriptError flash[:error] = 'Przykro mi, wiadomość nie może zostać dostarczona.'
    end
  end

  def cat
    @categories = Category.all
  end

  private
  def proposition_params
    params.require(:proposition).permit(:name, :email, :message, :url)
  end

end