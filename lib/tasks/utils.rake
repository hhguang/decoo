namespace :utils do

  desc "find_diff "
  task(:find_diff  => :environment) do |t|
    Spec.all.each do |spec|
      puts "#{spec.bh}" if ! spec.bh=="#{spec.product.bh}-#{spec.color.bh}"
    end
  end

end