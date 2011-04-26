task :test do
  $LOAD_PATH.unshift './lib'
  $LOAD_PATH.unshift './test'
  require 'filetype'
  require 'minitest/autorun'
  begin; require 'turn'; rescue LoadError; end
  Dir.glob("test/**/*_test.rb").each { |test| require "./#{test}" }
end

task :default => :test