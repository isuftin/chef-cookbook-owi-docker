describe directory('/tmp/test') do
  its('group') { should eq 'vagrant' }
  it { should be_owned_by 'vagrant' }
  its('type') { should eq :directory }
  it { should be_directory }
  its('mode') { should cmp '0644' }
end

describe file('/tmp/dummy.pdf') do
  its('group') { should eq 'vagrant' }
  it { should be_owned_by 'vagrant' }
  it { should be_file }
  its('type') { should eq :file }
  its('mode') { should cmp '0644' }
end
