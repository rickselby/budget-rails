# frozen_string_literal: true

require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  test 'should not save without a name' do
    budget = Budget.new

    assert_not budget.save, 'Saved a budget without a name'
  end
end
