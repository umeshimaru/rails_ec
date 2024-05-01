namespace :promotion_code do
  desc 'Insert 10_promotion_codes into promotion_table'
  task :generate => :environment  do
    begin
      ApplicationRecord.transaction do
        10.times do 
          promotion = Promotion.new
          promotion.code = SecureRandom.alphanumeric(8)
          promotion.discount_amount = rand(100..1500)
          promotion.save!
        end
      end
    rescue  ActiveRecord::RecordInvalid => e
      puts e
    end
    end
end
