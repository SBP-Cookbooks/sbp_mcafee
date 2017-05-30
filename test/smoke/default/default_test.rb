# Inspec test for recipe sbp_messageanalyzer::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('McAfee Agent') do
  it { should be_installed }
end

describe package('McAfee VirusScan Enterprise') do
  it { should be_installed }
end
