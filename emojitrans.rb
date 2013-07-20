require 'sinatra'
require './translator'
require './send_twilio'
require 'rubygems'
require 'twilio-ruby'


get '/emojitrans.rb' do
  print params
  initial_body = params[:Body]
  unless initial_body
    return "NO DATA"
  end
  text = initial_body.split("::")[0]
  number = initial_body.split("::")[1]
  # tODO: handle no number
  converted_text = Translator::translate(text)
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms converted_text
    twilio_send_text_to(number, converted_text)
  end
  twiml.text
end


def twilio_send_text_to(to_number, body)
	Account_sid = 'AC563b25874c9acd672de0346a4158206d'
	From_number = "+17813503815"
  begin
    client = Twilio::REST::Client.new Account_sid, ENV['TWILIO_AUTH_TOKEN']
    client.account.sms.messages.create(
      'from' => From_number,
      'to' =>   to_number,
      'body' => body
    )
  rescue Twilio::REST::RequestError => e
    puts "Error: " +e.message
  end
end

def convert(text)
  Translator::translate(text)
end
