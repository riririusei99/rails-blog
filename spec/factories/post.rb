FactoryBot.define do

  factory :post do
    title {"吾輩は猫である"}
    post { "吾輩わがはいは猫である。名前はまだ無い。どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。" }
    user_id {1}
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end