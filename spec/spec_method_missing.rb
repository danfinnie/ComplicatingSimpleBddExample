require 'spec_helper'

describe "Collaborator sharing documents" do
  include MethodMissingHelper

  context "Joe and Mary have no documents" do
    let!(:mary) { "Mary" } # Would really be FactoryGirl
    let!(:joe) { "Joe" }

    it "Recipient receives an email and sees doc in homepage list" do
      Given "Mary is signed in"
      And "Mary creates a document"

      When "Mary shares the document with Joe"
      Then "Joe receives an email"

      When "Joe is signed in"
      Then "Joe has 1 document"
    end
  end

  def login_as user
    true
  end

  def user_creates_a_document
    true
  end

  def user_shares_the_document_with_joe
    true
  end

  def user_receives_an_email
    true
  end

  def user_has_1_document
    true
  end
  
  def method_missing_mapping
    {
      /^([a-z]+)_is_signed_in$/ => proc { |match| login_as public_send(match[1]) },
      /^(?:mary|joe)(.*)$/ => proc { |match| public_send("user" + match[1]) }
    }
  end
end
