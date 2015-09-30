ReturnValue = require 'nanocyte-component-return-value'

class Change extends ReturnValue
  onEnvelope: (envelope) =>
    {data,message} = envelope

    return if data == message
    return message

module.exports = Change
