# frozen_string_literal: true

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @account = accounts(:one)
    @budget = @account.budget
    sign_in @budget.user
  end

  test 'should not get index' do
    assert_raise AbstractController::ActionNotFound do
      get budget_accounts_url(@budget)
    end
  end

  test 'should get new' do
    get new_budget_account_url(@budget)

    assert_response :success
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post budget_accounts_url(@budget), params: { account: { name: @account.name } }
    end

    assert_redirected_to budget_url(@budget)
  end

  test 'should show account' do
    get budget_account_url(@budget, @account)

    assert_response :success
  end

  test 'should get edit' do
    get edit_budget_account_url(@budget, @account)

    assert_response :success
  end

  test 'should update account' do
    patch budget_account_url(@budget, @account), params: { account: { name: @account.name } }

    assert_redirected_to budget_account_url(@budget, @account)
  end

  test 'should destroy account' do
    assert_difference('Account.count', -1) do
      delete budget_account_url(@budget, @account)
    end

    assert_redirected_to budget_url(@budget)
  end
end
