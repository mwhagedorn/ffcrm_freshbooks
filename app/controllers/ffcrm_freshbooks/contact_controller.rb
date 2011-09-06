module FfcrmFreshbooks

  class ContactController < ::ApplicationController

    def create
      @contact = Contact.find(params[:id])

    end
  end

end