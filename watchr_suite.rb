# Wrapper to run the specs.
def run_tests(test_type)
  case test_type
  when :all
    system('rake spec')
  when /(controllers)\/?/
    system('rake spec:controllers')
  when /(models)\/?/
    system('rake spec:models')
  else
    system('rake spec')
  end
end


# Ctrl-\
Signal.trap('QUIT') do
  puts "\n--- Running all tests ---\n"
  run_tests(:all)
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }


# Setup the test environment
ENV['RAILS_ENV'] = 'test'
system('rake db:drop')
system('rake db:migrate')
run_tests(:all)

# Watch the application files.
[
  'app/(.*/)?.*\.rb',
  'lib/(.*/)?.*\.rb',
  'spec/(.*/)?.*_spec\.rb'
].each { |pattern| watch(pattern) { |md| run_tests(md[1]) } }
