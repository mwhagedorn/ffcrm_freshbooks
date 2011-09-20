module FfcrmFreshbooks
  class FreshbooksGateway
    def create_contact(lead)
      contact = lead.contact
      #TODO - can a a converted lead ever not have an account?
      account = contact.account

    end
  end
end