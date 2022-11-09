# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'should not save without a name' do
    account = budgets(:one).accounts.new

    assert_not account.save, 'Saved an account without a name'
  end
end
