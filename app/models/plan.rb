class Plan
  PLANS = [:free, :premimum]

  def self.options
    PLANS.map {|plan| [plan.capitalize, plan]}
  end
end