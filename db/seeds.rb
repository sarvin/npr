channels = [
  {
    name:'first listen',
    display_name:'first listen',
    api_id:98679384
  }
]

channels.each do |channel_data|
  channel = Channel.find_by(name: channel_data[:name])

  if !channel
    channel = Channel.new(channel_data)
    channel.save
  end
end
