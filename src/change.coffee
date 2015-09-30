ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class Change extends ReturnValue
  onEnvelope: (envelope) =>
    {data,message} = envelope

    return if _.isEqual data, message
    return message

module.exports = Change
