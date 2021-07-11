class DatasetStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :draft
  state :submitted
  state :rejected
  state :withdrawn
  state :approved
end
