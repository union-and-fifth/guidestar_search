require 'rake/testtask'

Rake::TestTask.new do |test|
  test.test_files = FileList['spec/lib/guidestar_search/*_spec.rb']
  test.verbose = true
end

task default: :test

task :console do
  exec "irb -r guidestar_search -I ./lib"
end