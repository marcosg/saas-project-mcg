class Project < ApplicationRecord
  belongs_to :account
  acts_as_tenant(:account)
  validates_uniqueness_to_tenant :title
  validate :free_plan_can_only_have_one_project

  def free_plan_can_only_have_one_project
    if self.new_record? && (Project.all.count > 0) && (ActsAsTenant.current_tenant.plan == 'free')
      errors.add(:base, 'Free plans cannot have more than one project')
    end
  end

  def self.by_plan
    account = ActsAsTenant.current_tenant
    if account.plan == 'premium'
      account.projects
    else
      account.projects.order(:id).limit(1)
    end
  end

end
