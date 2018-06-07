describe command('docker volume ls | grep my_volume') do
  its('exit_status') { should eq 0 }
end
