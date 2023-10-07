# frozen_string_literal: true

class BudgetPolicy < ApplicationPolicy
  attr_reader :budget

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(user:)
    end

    private

    attr_reader :user, :scope
  end

  def initialize(user, budget)
    @budget = budget
    super(user)
  end

  def index?
    logged_in?
  end

  def new?
    logged_in?
  end

  def create?
    logged_in?
  end

  def show?
    owner?
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    budget.user == user
  end
end
