guard :rspec, cmd: 'bundle exec rspec -fd' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end


#