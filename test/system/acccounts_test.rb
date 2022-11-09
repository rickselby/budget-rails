# frozen_string_literal: true

require 'application_system_test_case'

class AccountsTest < ApplicationSystemTestCase
  setup do
    @account = accounts(:one)
    @budget = @account.budget
  end

  test 'visiting the budget' do
    visit budget_url(@budget)

    assert_selector 'h2', text: 'Accounts'
  end

  test 'should create account' do
    visit budget_url(@budget)
    click_on 'New Account'

    fill_in 'Name', with: @account.name
    click_on 'Create Account'

    assert_text 'Account was successfully created'
    click_on 'Back'
  end

  test 'should update account' do
    visit budget_account_url(@budget, @account)
    click_on 'Edit this account', match: :first

    fill_in 'Name', with: @account.name
    click_on 'Update Account'

    assert_text 'Account was successfully updated'
    click_on 'Back'
  end

  test 'should destroy account' do
    visit budget_account_url(@budget, @account)
    click_on 'Destroy this account', match: :first

    assert_text 'Account was successfully destroyed'
  end
end
