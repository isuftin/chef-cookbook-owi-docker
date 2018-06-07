describe command('docker network ls -f driver=bridge | grep my_bridge') do
  its('exit_status') { should eq 0 }
end
