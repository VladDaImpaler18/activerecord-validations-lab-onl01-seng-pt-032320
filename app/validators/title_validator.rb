class TitleValidator < ActiveModel::Validator
    def validate(record)
        phrases = Regexp.union(@@click_bait_phrases)
        unless record.title.match?(phrases)
            record.errors[:title] << 'Must have clickbait'
        end 
    end

    @@click_bait_phrases = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]
end