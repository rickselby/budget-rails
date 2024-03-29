# frozen_string_literal: true

require 'test_helper'

class BudgetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @budget = budgets(:one)
    sign_in @budget.user
  end

  test 'should get index' do
    get budgets_url

    assert_response :success
  end

  test 'should get new' do
    get new_budget_url

    assert_response :success
  end

  test 'should create budget' do
    assert_difference('Budget.count') do
      post budgets_url, params: { budget: { name: @budget.name } }
    end

    assert_redirected_to budget_url(Budget.last)
  end

  test 'should show budget' do
    get budget_url(@budget)

    assert_response :success
  end

  test 'should get edit' do
    get edit_budget_url(@budget)

    assert_response :success
  end

  test 'should update budget' do
    patch budget_url(@budget), params: { budget: { name: @budget.name } }

    assert_redirected_to budget_url(@budget)
  end

  test 'should destroy budget' do
    assert_difference('Budget.count', -1) do
      delete budget_url(@budget)
    end

    assert_redirected_to budgets_url
  end
end
