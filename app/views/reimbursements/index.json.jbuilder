json.array!(@reimbursements) do |reimbursement|
  json.extract! reimbursement, :id, :status, :team, :credit_card, :value, :description
  json.url reimbursement_url(reimbursement, format: :json)
end
