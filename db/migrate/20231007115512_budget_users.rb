class BudgetUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :budgets, :user, index: true
  end
end
