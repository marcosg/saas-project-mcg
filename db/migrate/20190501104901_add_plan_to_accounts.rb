class AddPlanToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :plan, :string
  end
end
