require 'spec_helper'

describe "Collaborator sharing documents" do
  context "Joe and Mary have no documents" do
    let!(:mary) { "Mary" } # Would really be FactoryGirl
    let!(:joe) { "Joe" }

    it "Recipient receives an email and sees doc in homepage list" do
      Given "Mary is signed in"
      And "Mary creates a document"

      When "Mary shares the document with Joe"
      Then "Joe receives an email"

      When "Joe is signed in"
      Then "Joe has one document"
    end
  end

  def mary_is_signed_in
    true
  end

  def mary_creates_a_document
    true
  end

  def mary_shares_the_document_with_joe
    true
  end

  def joe_receives_an_email
    true
  end

  def joe_is_signed_in
    true
  end
  
  def joe_has_one_document
    true
  end
end
