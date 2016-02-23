ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class Change extends ReturnValue
  onEnvelope: (envelope) =>
    {data,message,config} = envelope

    return if _.isEqual data[config.key], message[config.key]
    return message

module.exports = Change
