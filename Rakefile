require 'rubygems'
require 'rubygems/package_task'
require 'ant'

require 'appengine-sdk'
require 'mirah_task'

Gem::PackageTask.new Gem::Specification.load('mirah_model.gemspec') do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

#require 'maven/junit/junit'
# -- will work after maven support --JUNIT_JAR = Gem.find_files('maven/junit/junit.jar').first

TESTING_JARS = [AppEngine::SDK::API_JAR,
                AppEngine::SDK::LABS_JAR,
                'javalib/junit.jar',
                *AppEngine::SDK::RUNTIME_JARS.reject {|j| j =~ /appengine-local-runtime/}
              ]
              
TESTING_JARS.each {|jar| $CLASSPATH << jar}

#Mirah.compiler_options = ['-V']

task :default => :test

task :init do  
  mkdir_p 'build'
end

task :clean do
  ant.delete :quiet => true, :dir => 'build'
  ant.delete :quiet => true, :dir => 'dist'
end

task :compile => :init do
  # build the Mirah sources
  puts "Compiling Mirah sources"
#  args = Dir['src/**/*.{mirah,duby}'] + [{ :dir => 'src', :dest => 'build',:options => ['-V']}]
#  mirahc *args
#=======
#  # build the Duby sources
#  puts "Compiling Duby sources"
  mirahc 'meta_model.mirah', :dir => 'src', :dest => 'build'
  mirahc 'model.mirah', :dir => 'src', :dest => 'build',
         :options => ['--classpath', Dir.pwd + "/build/"]
#>>>>>>> 4b793b085e8d7d5bad6b91eeb90d84a5f0a0d962
end

desc "run tests"
task :compile_test => :jar do
  puts "Compiling Mirah tests"
  args = Dir['test/**/*.{mirah,duby}'] + [{ :dir => 'test', :dest => 'test',
         :options => ['--classpath', Dir.pwd + "/lib/mirahdatastore.jar"]}]
  mirahc *args  
end

file 'lib/mirahdatastore.jar' => :jar

desc "build jar"
task :jar => :compile do
  ant.jar :jarfile => 'lib/mirahdatastore.jar' do
    fileset :dir => 'lib' do
      exclude :name => '*.jar'
    end
    fileset :dir => 'build'
  end
end

task :test => :compile_test do
  ant.junit :haltonfailure => 'true', :fork => 'true' do
    classpath :path => (TESTING_JARS + ['build', 'test']).join(":")
    batchtest do
      fileset :dir => "test" do
        include :name => '**/*Test.class'
      end
      formatter :type => 'plain', :usefile => 'false'
    end
  end
end
