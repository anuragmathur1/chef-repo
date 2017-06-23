# # encoding: utf-8

# Inspec test for recipe jenkins::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.

#describe package('git') do
#  it { should be_installed }
#end

describe directory('/var/awslogs') do
  it { should exist }
  it { should be_owned_by 'root' }
  its ('mode') { should cmp '0755' }
end


describe directory('/var/awslogs/etc') do
  it { should exist }
  it { should be_owned_by 'root' }
  its ('mode') { should cmp '0755' }
end

describe file('/var/awslogs/etc/awslogs.conf') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  its ('mode') { should cmp '0644'}
end

describe processes('/var/awslogs/bin/python /var/awslogs/bin/aws') do
  its('users') { should eq ['root']}
end

