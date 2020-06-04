# Inspec test for recipe sbp_mcafee::default

describe package('McAfee Agent') do
  it { should be_installed }
end

describe package('McAfee VirusScan Enterprise') do
  it { should be_installed }
end
