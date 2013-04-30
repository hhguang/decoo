namespace :utils do

  desc "find_diff "
  task(:find_diff  => :environment) do |t|
    Spec.all.each do |spec|
      puts "#{spec.bh}" if ! spec.bh=="#{spec.product.bh}-#{spec.color.bh}"
    end
  end

  desc "upload pic and db"
  task(:upload => :environment) do |t|
  	#require 'net/ssh'
	#require 'net/sftp'
	Net::SSH.start('42.120.19.221', 'rails', 'hhg1024') do |ssh|
	 ssh.sftp.connect do |sftp|
	   Dir.foreach('.') do |file|
	     puts file
	   end
	 end
	end
  end

end