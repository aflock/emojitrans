require 'rumoji'
class Translator
  def self.emoji_translator
    {
      ":smile:"                        => ':)',
      ":smiley:"                       => '^_^',
      ":grinning:"                     => ':)',
      ":blush:"                        => 'o_o',
      ":relaxed:"                      => '#:#',
      ":wink:"                         => ';)',
      ":heart_eyes:"                   => '<3 _ <3',
      ":kissing_heart:"                => ':*',
      ":kissing_closed_eyes:"          => ':*',
      ":kissing:"                      => ':*',
      ":kissing_smiling_eyes:"         => ':*',
      ":wink2:"                        => ';)',
      ":stuck_out_tongue_closed_eyes:" => ':P',
      ":stuck_out_tongue:"             => ':P',
      ":flushed:"                      => '(*~.~*)',
      ":grin:"                         => ':)',
      ":pensive:"                      => ':(',
      ":satisfied:"                    => '^-^',
      ":unamused:"                     => '(~_~;)',
      ":dissapointed:"                 => ':(',
      ":persevere:"                    => '#-_-#',
      ":cry:"                          => ':,(',
      ":joy:"                          => ':D',
      ":sob:"                          => ':,,,(',
      ":sleepy:" => '-_-zzz',
      ":relieved:" => '@_@',
      ":cold_sweat:" => ':0',
      ":sweat_smile:" => ':,D',
      ":sweat:" => ':|',
      ":weary:" => ':{',
      ":tired_face:" => ':p',
      ":fearful:" => ':o',
      ":scream:" => '0_0AAH',
      ":angry:" => '>:(',
      ":rage:" => '>:(',
      ":triumph:" => ':D',
      ":confounded:" => '?_?',
      ":laughing:" => ':D',
      ":yum:" => 'yum!',
      ":mask:" => '(sick)',
      ":sunglasses:" => '8:)',
      ":sleeping:" => 'hi'
    }
  end

  def self.translate(text)
    human_text = Rumoji.encode(text)
    emoji_translator.each { |k, v| human_text.sub!(k, v) }
    human_text
  end
end
